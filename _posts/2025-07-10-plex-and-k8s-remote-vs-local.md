---
title: 'Plex and K8s: solving remote vs. local traffic'
description:
categories: ['homelab']
---

In the current iteration of [my homelab](https://github.com/sarumont/homelab),
I'm running Plex in a k8s cluster (along with everything else I can). This
setup has been humming along nicely until I recently segregated my LAN with
VLANs. Why? Because my kids are old enough that they have friends with devices,
and I trust them about as far as they can throw me. But I digress...

I have a VLAN for "Media and Adults" — my stuff, my wife's stuff, and any media
devices we need to control from our phones (so I don't have cross-VLAN
UPnP/Avahi/etc. headaches). At first, I simply allowed all VLANs to access my 
Plex server via firewall rules. Simple, functional.

**The VLANs don't actually have anything to do with this issue**, but when I
implemented them I also:
- tightened up my _LAN Networks_ config (by removing the entire `10.0.0.0/8` subnet)
- added throttling for remote traffic (since I was recently able to use _Remote Access_ due to escaping CGNAT)

# A road trip intervenes

Staring down the barrel of an 11-hour roadtrip for the Fourth this year, I
started loading up some new movies onto the laptops and music onto the iPods.
Wondering what the hell was taking so long, I discovered that Plex was treating
all my local traffic as WAN traffic and throttling it to 20Mbps, as it is
configured to do based on my WAN uplink speed.

Why? Because kubernetes. When your app is running as a container inside of k8s,
there is additional networking happening. This means that every bit of traffic
is coming from a DIFFERENT IP than the actual client IP. It [appears that Plex is
ignoring RFC1918 traffic](https://forums.plex.tv/t/x-forwarded-for-trust-configuration/889105) when handling the `X-Forwarded-For` header. Bummer.

# Delving deeper

Faced with this limitation, I came up with a plan: two k8s `Service` entries of
differing types. How does this get around the problem? Well, I'm using
[metallb](https://metallb.io/) to issue IPs for `LoadBalancer` services. This
ensures that the IP is not tied specifically to a physical server running my
cluster - its target can move. The implementation details for this result in a
`flannel` interface on my k8s nodes:

```
5: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UNKNOWN group default
    link/ether ea:f4:ba:59:7e:5f brd ff:ff:ff:ff:ff:ff
    inet 10.42.0.0/32 scope global flannel.1
       valid_lft forever preferred_lft forever
    inet6 fe80::e8f4:baff:fe59:7e5f/64 scope link proto kernel_ll
       valid_lft forever preferred_lft forever
```

This is different from the `cni` interface that is the Container Network
Interface that the k8s nodes use:

```
6: cni0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default qlen 1000
    link/ether be:18:51:21:ad:f5 brd ff:ff:ff:ff:ff:ff
    inet 10.42.0.1/24 brd 10.42.0.255 scope global cni0
       valid_lft forever preferred_lft forever
    inet6 fe80::bc18:51ff:fe21:adf5/64 scope link proto kernel_ll
       valid_lft forever preferred_lft forever
```

Take a close look at those IPs, and you'll see where I'm going. I [added a
`NodePort`
service](https://github.com/sarumont/homelab/blob/26f7fe75d36b4c1d3ce4dcc3fecf276332528d89/tf/plex/main.tf#L67-L85)
to my Plex deployment. The `NodePort` ends up on `cni0`, and the `LoadBalancer`
ends up on `flannel.1`.

Take your `cni0` IP to use for your firewall mapping for ingress from your
WAN. Use your `flannel` IPs to use for local traffic. Note that you should also
put these IPs in the _List of IP addresses and networks that are allowed without 
auth_ section to only allow local traffic to access your Plex server without
auth. Or just remove everything from that input if, like my case, you have
untrusted VLANs allowed to access Plex.

Check out the [README](https://github.com/sarumont/homelab/blob/20cfd715329fed4959b5811e8d0dcd90b75d4f6e/tf/plex/README.md) in my Terraform module for more details on how to implement this.

# Final Thoughts

Yes, it's a bit brittle. If my Plex server ends up on another k8s node, my
remote access will stop working. I am OK with that because

1. k8s doesn't just move workloads, willy-nilly
1. I can always pin the Plex deployment to a node via node selectors
1. I can also fix this if I'm the one remote when it breaks (or when I notice
   it) by connecting to my Tailnet
1. Local traffic is my priority with this setup, so I want THAT to be the more
   solid option

Brittleness aside, it works well and gets the job done. And besides... what's a
homelab without a little duct tape?

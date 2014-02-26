---
title: 'The Sad State of Laptops (2014)'
date: '2014-02-24'
description:
categories: ['technology','rant']
tags: ['development', 'gaming', 'laptops']
---

It is 2014, and I carry around a computer in my pocket which is infinitely more capable than my
first 486DX desktop. Mobile technology has been improving at a vast pace, but traditional computing
has been left in the dust. The order of the day: performance, resolution, portability: pick one.

### The Requirements

#### Performance

As a developer, performance is key. Waiting for a compiler is both frustrating and makes one 
prone to distraction. As such, I categorically discount all Intel ULV processors (model numbers
ending in 'U'). It is *extremely* hard to find benchmarks that are relevant to
developers such as compile times, so I discount them based on [general benchmarks][11].

#### Resolution 

Having a lot of pixels is a requirement for any developer. Higher resolutions allow you to view more
code, documentation, debug windows, etc. at once - up to a point. With the retina-like displays we
are able to purchase now, it becomes a matter of high-quality rendering (vector graphics and more DPI). 
I'm not sure at what DPI that balance changes, as I have not had the pleasure of a retina display.

#### Portability

This requirement is an amalgamation of a few key things:

* battery life
* size
* weight
* ergonomics

Battery life has, until recently, been very hard to achieve when also desiring high performance.
Intel's Haswell chips, however, seem to have made it easy to have excellent battery life while not
skimping on performance.

Size and weight are still a problem, however, when you are looking for performance and resolution.
Most smaller (&lt;=13") laptops ship with ULV processors leaving us looking at larger, heavier laptops
for performance. If gaming is also important, getting a discrete GPU (and the copper necessary to
keep it cool) typically means adding weight.

Ergonomics are always important, but when travelling, they are limited to what comes with the
laptop itself. The biggest things to consider here are the keyboard and trackpad. I absolutely hate
laptop keyboards with a number pad. Aside from being useless, the number pad means the actual
keyboard is off-center with the screen and trackpad, resulting in the right palm hitting the
trackpad very frequently

### The Options

When it comes down to brass tacks, there are three main approaches to a developer's computing setup:
laptop-only, desktop-only, and both. In this day and age, I think that 'desktop-only' is mostly
obsolete. Developers want to or have to travel: conferences, meetup groups, coffee shops, and bars
are our new primary or secondary offices. For those of us that work from home, getting out to one of these
locations may be our only interaction with the rest of the world for months on end. I have seen a
desktop set up at a coffee shop once in my life, and even I thought the owner was crazy.

### Laptop and Desktop

This category can be further broken down into a few subcategories, depending on budget and needs:

* thin client + powerful desktop
* thick client + powerful desktop
* powerful laptop + powerful desktop

#### Thin Client

I define thin client in a less-traditional sense here. For my application, a thin client is any
device which enables development on a remote machine. The key here is that nothing resembling a
development environment is located on the client itself. 

The thin client solution is very appealing from a portability perspective, especially today. A thin
client can be something like a Chromebook, ultraportable laptop, or any tablet with a keyboard. This provides a
solution with excellent battery life and a tiny footprint.

Unfortunately, there are many cons. Local development is either impossible (tablets) or extremely
slow (ultrabooks). GUI development is potentially problematic, depending on the platform. Mobile
development is also impossible (tablets) or requires building remotely, transferring to the thin
client, and finally deploying to the device. On top of all of that, this method depends on a solid
connection to the Internet when not at home, and that is still not ubiquitous in the US.

#### Thick Client

The line between a thin and thick client may be fairly arbitrary, but it is an important one to
consider. Thick clients would be laptops (no tablets this time) which are very portable but not
powerful. This class includes small laptops with ULV processors. The benefits over the thin client
are clear: local development *is* possible, though the preferred method (with adequate connectivity)
is developing remotely, as your iteration time is most likely lower.


#### Powerful laptops

This solution is the best of both worlds. It is also the most expensive to maintain. Given this
option, it would be feasible to drop GPU requirements on the laptop to keep costs down.

---

One major failing that all of these solutions share is maintaining multiple development
environments. This was my solution for many years (desktop, thin-client/server at work, laptop), and
I cannot count the times where I was on a plane and out of date because I forgot to pull new code
before taking off. Not to mention maintaining IT for multiple everyday-use machines. This is one
reason why I have been running a single laptop for the past three years. Speaking of which...

### Laptop only

This is the (theoretically) more elegant solution. You also have a single point of failure, but
replacing laptop parts should be do-able with a fair amount of speed. And if you don't have your
data and configurations backed up, you deserve to lose it all.

The problem here is trying to satisfy all of my above requirements without sacrificing anything. My
current laptop is a [Sager NP9150][1]. It sacrificies portability by being large and heavy with no 
battery life and a damned number pad. The power brick is more like a cinder block...

By this point, most manufacturers have their Haswell-refreshed lineups available. As such, I have
a few laptops which are close to meeting all of the requirements above. Unfortunately, none hit
everything perfectly.

#### [Razer Blade][3]

Despite [evoking Hackers][2], this system still falls short for a standalone solution. It lacks a
wired NIC which makes it less than ideal for a desktop replacement. Transferring large amounts of
data around your LAN? I'll take GigE any day. Fortunately, a [USB 3.0 to GigE adapter][4] can make
this a non-issue.

The Blade also has a low-DPI screen. 1600x900 on a 14" display is unexcusable in 2013, especially
given the price tag.

Finally, there is no DisplayPort connector. With [4k displays becoming attainable][5], we need to kick
HDMI (1.4, at least) to the curb already.

#### [Lenovo T440p][6]

Being a former Thinkpad owner and longtime Thinkpad fan, I can't help but want to go back to Lenovo.
It seems that the T440p does a fair job at hitting my requirements. The screen is not "retina", but
it has a very acceptable DPI. Notebook Review [found some issues with the case construction][7] in
their review, so that raises some concern. Other nits I can pick: the GPU is only a 730M, and the
laptop is fairly chunky, coming in at 1.18" thick.

#### [Macbook Pro (2013)][8]

Oh, Apple. How I hate to love thee. Apple makes beautiful hardware, yet I despise the walled-garden
philosophy behind their business model. I also doubt I would be as efficient in OS X as I am in
Linux, even with a serious investment of time (and money into App Store apps).

Besides that, the Haswell Macbook Pros are beautiful. The 13" nails every requirement, save GPU. And
the 15" adds a discrete GPU, losing a bit of battery life and gaining some heft in the trade. Cons
here include OS X (or lost functionality and frustration getting Linux on it) and price, as the
sexiness carries a hefty premium.

#### [Dell XPS 15][9]

I almost did not find the XPS 15, but I'm glad I did. It comes in around the Macbook Pro 15 and
T440p in the portability category, but it surpasses the T440p with a high-DPI screen. It packs a
slightly wimpier CPU than the Macbook and Thinkpad, but it also equals the Macbook (surpassing the
Thinkpad) in GPU. It is very sleek (0.7" thick) and appears to be well-built. I have read some
disappointing reviews regarding battery life and build quality (specifically, some whining EMI
issues), and I'm also apprehensive about a glossy screen.

### Ugh.

It is readily apparent that nothing on the market can satisfy my, admittedly particular,
requirements. I'm encouraged to see that there are three contenders that are *very* close. If I
decide to upgrade this CPU cycle, I think the T440p would be my choice. 1080p on a 14" screen is
still an upgrade from the same resolution on my 15.6", and the size and weight are both improvements
to my NP9150. The sad fact, though, is that none of these upgrades would be exponential; they are
all incremental. Maybe [the Broadwell generation][10] will allow me to have it all.

 [1]: http://www.amazon.com/Clevo-P150EM-Sager-NP9150-Gaming/dp/B00C76CBNY/ref=cm_cr_pr_product_top
 [2]: https://www.youtube.com/watch?v=xhpoqjB4NkE
 [3]: http://www.razerzone.com/gaming-systems/razer-blade
 [4]: http://www.amazon.com/gp/product/B0095EFXMC/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0095EFXMC&linkCode=as2&tag=sigilorg-20
 [5]: http://www.pcworld.com/article/2084966/dells-28-inch-4k-desktop-monitor-will-only-cost-700.html
 [6]: http://shop.lenovo.com/us/en/laptops/thinkpad/t-series/t440p/
 [7]: http://www.notebookcheck.net/Review-Lenovo-ThinkPad-T440p-20AN-006VGE-Notebook.108423.0.html
 [8]: http://store.apple.com/us/buy-mac/macbook-pro
 [9]: http://www.dell.com/us/p/xps-15-9530/pd
 [10]: https://en.wikipedia.org/wiki/Broadwell_(microarchitecture)
 [11]: http://www.notebookcheck.net/Mobile-Processors-Benchmarklist.2436.0.html

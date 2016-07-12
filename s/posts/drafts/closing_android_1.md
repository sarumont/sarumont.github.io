---
title: 'Closing Android'
date: '2014-02-25'
description:
categories: ['foo']
---
[Ars recently
published](http://arstechnica.com/gadgets/2013/10/googles-iron-grip-on-android-controlling-open-source-by-any-means-necessary/)
a great article examining the continuing closed-sourcing of the Google Android experience. Between
that and [a recent discussion with a colleague](https://plus.google.com/u/0/110965477166510475186/posts/44cFyeAyuhm), I've given a good bit of thought to the issue. This post is as much for myself as it is for the world, as there is a lot going on here.

# Open Sesame

It is important to understand a bit about open source software. I have lived in this world fully for
the past decade, using various Linux distributions and FreeBSD as my desktop operating system(s).
I have contributed the odd patch here and there, though I can't claim any major open source
contributions. If you understand nothing else about open source, understand this: *it is technically
impossible to make an open-source project closed-source after it has been published*.

In the Ars article linked to above, they detail a process which I have never seen used in this
fashion: abandonment. When evaluating an open source tool or library for use, one of the
things I will look for is a sign of life. When was the last version published? When was the website
last updated? Is there a mailing list? Forum? IRC channel? 

This is the number one cause of open source project death in my experience. The maintainers get 
busy or bored and move on. The code rots as the libraries it depends on change underneath it.
Eventually, you won't be able to compile it on a modern system without digging into the Makefile or
code itself to fix some incompatibility. And Google is using this as a technique for pulling Android
features back into the Googlesphere. Do you still use any third-party applications that look like
they are from the FroYo days? I didn't think so...

# Close the Door

One possible reason for this gradual extraction from AOSP is that Google wants to more closely
control the Android experience. By pushing updates to Calendar through the Play Store, they are able
to update older devices without pushing an entire new OS. This removes the dependency on both the
OEM and th  carrier, both of which have been notoriously bad about update timeliness.

If this is the case, however, why not keep the applications open source like Chromium? This would
allow the best of both worlds: timely updates to all phones along with community contributions. This
is not, however, the case.

# All About the Benjamins

For the majority of the applications mentioned in the Ars article, there is intellectual property at
stake. The latest versions of Google Search, Music, Camera, and (now) Messaging/Hangouts represent
large shifts from the previous. Calendar hasn't seen much action, but I'd bet on more Google Now
functionality coming in the future.

In my eyes, this is a large reason behind the shift; Google wishes to protect their IP as these
applications become more complex as well as more dependent on the Google cloud. 

# Locked In

When vendor lock-in is discussed, the big point of discussion is exit cost. How much
time/money/ritual animal sacrifice will it take to move from Company A to Company B? Another facet
of lock-in is interoperability. The "walled garden" is to the extremely non-interoperable side of
this scale, exemplified by (a slightly older) Facebook.

## Interoperability

Facebook has become more interoperable with the Internet at large over recent years, but they have
historically been a walled garden. You could not do *anything* without creating an account on
Facebook, thus entering the garden. 

External interaction is still very minimal: you can view public
pages (businesses and people), and Facebook also integrates with the protocol underlying all email:
SMTP. A limited form of interoperability is found in the Facebook messaging platform which allows
third-party clients via XMPP. This protocol, however, is designed to allow so-called
server-to-server communication, enabling users at companyA.com to chat with users at companyB.com.
Facebook has not implemented this feature, keeping its users inside the walled garden.

[Until
recently](http://www.pcworld.com/article/2039820/google-weak-xmpp-support-capabilities-led-us-to-proprietary-tech-in-hangouts.html)
Google's Hangouts chat system was built on XMPP, complete with server-to-server support; the new
Hangouts-based system continues to support third-party clients (for now), but it drops
server-to-server federation. This completely breaks interoperability, forcing people to create a
Google account to chat with another Google user.o

## Lock-in

How hard is it to de-Google your life? That all depends on how many (and which) Google services 
you use. I'll analyze a few of the big services and others that I use below.

### Google Search

The gateway drug of the Googlesphere, search is its bread and butter. Google and search are
synonymous. How many times do you hear "Google such-and-such" vs. "search for this thing"? I'd wager
that ratio is at least 1:1. Luckily, search is pretty easy to replace, as there are still several
search providers in the wild. Unless you actually care about preserving your search history, this
switch would be pretty painless.

### Gmail

The gateway drug for some, GMail has arguably revolutionized email. That said, it's still email.
You can still connect to GMail via IMAP, POP and SMTP. You can, with relative ease for a technical
persion, export your GMail data into another provider.

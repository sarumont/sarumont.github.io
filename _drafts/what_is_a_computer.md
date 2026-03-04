---
title: 'What is a computer?'
date: '2024-03-01'
description:
tags: []
---

Last year, I embarked upon a journey that I've mentally flirted with for some time: I replaced my laptop with an iPad Pro (and Magic Keyboard).

Annoyances:

"Blink would like to paste from Discord - would you like to allow this?"


The 11” is a bit cramped, the keyboard is annoying at times (the number row is under the screen, so it’s hard to hit), iPadOS gets in the way a bit. The OS experience is either great or terrible, depending on the task at hand…it rarely gets to “mediocre” 😛

I was already starting to lean that way, honestly. The annoyances/limitations of iPad OS wearing on me over the year and the form factor were probably the biggest factors.

Probably still a fine decision for “normal people”, too. Not a geek who has spent countless hours making his desktop as efficient as possible to perform the task at hand, building `vim`-like keybindings into everything, and using tiling window managers. 🤣

Some weird shit sometimes with the on-screen keyboard chip blocking inputs it is not on top of. This occurs while using the Magic Keyboard.

Why is the Magic Keyboard's USB-C port only for power and not a TB port? :facepalm:

---

I just bought a Lenovo Legion Go (1st Gen). This little guy features an AMD Z1 Extreme CPU, 16GB RAM, and a 1TB SSD inside and a gorgeous 8.8" 1440p display outside (OK, maybe it's not so little). My goal? Can I replace my Lenovo X1C for things I use my laptop for (like writing this post) most of the time while being able to play some games, mainly with my son and brother.

A digression: I gave up video games several years ago. I even changed my Steam
password to something random and didn't save it, forcing me to go through 
password recovery to get back into it (looking at my password manager, I did the
same thing to my Blizzard account).

## Broken Windows

I haven't run Windows as my primary OS since... well, college. That's over 20
years ago. So my first order of business was to install SteamOS. I will probably
try Bazzite at some point, though maybe not if I can get SteamOS to do
everything I want.

- tried booting my Ventoy USB stick, but the Go doesn't see it 
- burned the SteamOS image directly to another USB stick, and the Go doesn't see it

I'm wondering at this point if there isn't a USB 2.0 controller onboard? That
seems very weird to me, but I went through Windows 11 setup and tried to burn
the image using Rufus, but Windows showed an error for both these USB flash
drives.

At this point, I discovered [iVentoy](https://www.iventoy.com/en/doc_start.html) — holy crap is that neat! But the
SteamOS image is *not* an ISO, so off to Best Buy I went to buy a new USB 3.0
stick. Seems like highway robbery that they charge so much more for a USB-C key
than USB-A, but that is probably better for all the older hardware in my homelab
anyway.


## Enter: SteamOS

USB 3.0 drive worked a treat, and I'm now in SteamOS. First real hurdle:
Fortnite. Why? Because my son plays it. Now, Fortnite doesn't run on Linux
because Epic Games. Based on what I've read of this, I'd normally boycott the
game on principle. But this is about father-son gaming, so I'll just suck it up
and not give them any money.

First, I attempted Heroic Games Launcher. They make it crystal clear that it
should NOT be expected that Epic games work on SteamOS due to anti-cheat.
OK...I'll try anyway. And fail. Moving on.

My next option was Xbox Game Pass. Fortnite is free to play on there, and it
looks like I can get 1 hour/day on the free tier. Perfect. Follow the
instructions [that Microsoft
provides](https://support.microsoft.com/en-us/topic/xbox-cloud-gaming-in-microsoft-edge-with-steam-deck-43dd011b-0ce8-4810-8302-965be6d53296),
and I am happily running Fortnite on SteamOS on my Lenovo Legion Go. That was
surprisingly simple, and I only have to taint my machine with Microsoft Edge and
not a full-on dual-boot scenario. Win.

### Battle.net

Reason #2 for this experiment (or rationalization #2, if you like): the ability
to play WoW with my brother. WAY back in the day, we used to play (as in...when
WoW came out) quite a bit with several friends from high school. At the time, I
did this via WINE on FreeBSD on my desktop. Yes, you read that correctly.
Running Blizzard games via WINE really gives me no pause whatsoever. I have
always been convinced that Blizzard actually tests internally on WINE and have
never had an issue running their titles on my Linux machines.

This process showed me NonSteamLaunchers, a fantastic Decky plugin which made
Battle.net a breeze. I was also able to remove my custom Xbox Game Pass shortcut
in favor of the ones that NSL provides and manages, including a "straight to
Fortnite" launcher. Another win.

### Real Computer

At this point, I have been using Desktop mode a little bit (I made my grocery
order yesterday with it), but I'm still using the built-in KDE Plasma DE. On my
Linux machine(s), I have used awesomewm (TODO: link) and now swaywm (TODO: link)
for... longer than I can remember. At least as far back as when I ran FreeBSD as 
a desktop OS, as evidenced by my Github repos (TODO: link). And so to replace my
laptop, I must be able to install Sway on the Legion Go. Or Hyperland... maybe I
can take this opportunity to try it out.


Considerations:
- security - can I have an encrypted section for sensitive files?
- what do I need to back up to make restoring a breeze?
- Bazzite...?


Desired hardware/accessories:
- more portable USB-C hub
- right-angle USB-C adapter
- BT KB (bonus for trackpoint)
    - Logitech K380
- controller game charging dock JSAux - why dude got these sticks is beyond me,
  the ergonomics SUCK
- slim case (JSAux) - or sleeve for screen + KB and some other way to carry the
  joysticks?
- battery upgrade
- XReal glasses :D

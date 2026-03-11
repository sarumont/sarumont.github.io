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

#### Hyprland

OK, I first attempted to get Hyprland working, but it seems that since [this
tutorial]() was written, Hyprland has dropped `wl-roots` in favor of its own
compositor. That's all well and good...but the custom one (`aquamarine`) does
NOT have an X11 backend. Which makes it a no-go on the X11-backed SteamOS. So
I'm sticking with `swaywm`, which is fine by me because I'm very happy there.

#### swaywm

This was VERY straightforward.

<insert nix setup>

Caveats:
- I, like the author of the Holoshed posts, found that `nix-daemon` did not
  cleanly restart upon reboot. After further investigation, I discovered that, if 
  I started it, it would actually prevent me from exiting Desktop mode. To work
  around this, I updated my `sway.sh` launch script to use non-daemon mode for
  `nix`.
- I have to reset the GTK scale factor when starting Sway. No biggie - I put it
  in my sway config as an `exec` directive
- my `tmux` sessions don't seem to survive killing and restarting sway. I may
  try to figure out a workaround here, but it shouldn't be a huge deal because I
  still compulsively `:w` everything

In addition to my first discovery, I had to remove some `exec` directives that
lived in my `sway` config for general-purpose use. [My
dotfiles](https://github.com/sarumont/dotfiles) have a provision for host-based
configuration, so I just moved these to their relevant hosts (i.e. - my laptop.
Which should not be in play much longer)

#### Other things

My personal computer use falls into one of the following categories:

- web stuff (finances, trip planning, general research, etc.)
- light terminal stuff (writing this blog, homelab configuration, etc.)
- PKM management in Obsidian

The first two are easily taken care of already with `ghostty`, `neovim`, and
Firefox. The last requires Obsidian and Syncthing. I want to be able to launch
directly into Obsidian, so I'm going to install both Obsidian and Syncthing via
Flatpak.

##### Syncthing

```sh
flatpak install me.kozec.syncthingtk
```

Easy, peasy. Now, Install the Decky plugin for Syncthing, configure it how you
like, and Bob's your uncle. One consideration I want to revisit is security of
my files - they are not encrypted, unfortunately. I have set a PIN to lock the
Legion, so that is one deterrent. But, given physical access and a USB stick,
all of those files are laid bare. I'm thinking about an encrypted directory
inside of `~`...or even a permanently installed encrypted SD card. But that's
for a future post.

##### Obsidian

Now that I have my second brain on my Legion, time to get Obsidian going. Again,
it's as easy as:

```sh
flatpak install md.obsidian.Obsidian
```

And done. Add a non-steam launcher for it, and I can get into my notes easily
from Game Mode.

##### Tailscale

Tailscale was pretty straightforward as well using [this
repo](https://github.com/tailscale-dev/deck-tailscale) for a systemd overlay. I
may have to investigate this strategy for other things (i.e. nix-daemon?) in the
future.

##### SSH

Just a friendly reminder that you will, as always, need to use an existing key
to ssh into server(s) and upload your new key, assuming you're disabling
password login (which should be the case for anything publically accessible).

# Will it blend?

OK, now that everything is (mostly) set up, can I use the Legion Go ONLY? I have
my trusty X1C closed in my office. I'm going to try to use only the Go for the
next month. That will encompass: monthly accounting and my little league roster 
(both Google Sheets), writing this blog (I'm doing it on the deck now), Homelab
maintenance (I have an infinitely long TODO list here), trip planning (Cancun
next week and Alaska in August), and weekly menu planning and shopping.

I'll report back here in a month or so with any issues, real or perceived, that
I have stumbled across. So far, I'm quite pleased with this setup. We'll see how
it ages.

https://holo-shed.github.io/dev-diary/04-holoshed-on-the-deck/
https://guacamolie.nl/en/blog/sway-on-the-steam-deck/

--- 

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

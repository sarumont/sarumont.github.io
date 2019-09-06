---
title: 2019 OS Showdown
layout: post
---

# Terminals

Some requirements here:

 - fast
 - resource-efficient
 - good font rendering
 - ligature support
 - emoji support 

On Linux, I found one more:

 - proper scaling

TODO: links 

I'm currently typing this in my WSL2 VM on Windows 10 in the Windows Terminal Preview (link here). It's pretty good, and it meets most of my requirements above...

Text input feels slightly sluggish. I don't have anything really to scroll right now, so I can't validate scrolling performance. Oh, and the Windows 10 emoji input doesn't work. But it gets top marks for the rest: font rendering is beautiful, ligatures are supported, and it's consuming 25MB of RAM (comparable to Termite). 

I had completely given up on Windows until my buddy, Justin, reminded me of Windows Terminal. I had relegated knowledge of it to the back of my brain, along with the thought that it would be coming through updates to the Command Prompt. I'm glad to know that isn't the case; *this is the best terminal you can have on Windows right now.*


I couldn't find a terminal on Linux that met them all. Terminology is beautiful but won't render emoji. It's also not resource-lite nor does it scale properly (more on that later). Nothing VTE-based renders ligatures, but emoji support is fine. I settled on Termite, as it is pretty lightweight, supports emoji, and scales nicely. 

There are some others like alacritty, kitty, etc. which seem to be fast, but they generally don't scale. They also push the 100MB mark on RAM consumption just sitting there.

I used to run `st`, and I have played with it a bit, but 

## Scaling

My new laptop is a Thinkpad X1 Extreme Gen 2 with a 4k display on the laptop itself. When at my desk, I have a Dell U3419W - a curved, 34" display at a sane 3440 x 1440. Going from laptop to external on Linux generally means that I go from normal to comically large or blindness-inducing small UI elements. 

Luckily, I found a hack: a script which will reset my DPI. This works by setting `Xft.dpi` and some other settings. Terminals like alacritty and kitty don't respect any of these (I have not dug in to see if there is something they DO respect). Terminology respects an environment variable, but that really precludes launching anything from my WM. Thus, I'm limited to GTK (and QT) apps. Hence, Termite. But Termite is VTE-based, so no ligatures. 

# Window Management

The most exciting bit about going back to Linux for me was the thought of reviving my AwesomeWM configuration. I had emulated it as best I could in macOS with Alfred providing `run-or-raise` functionality and iTerm2 providing a visor mode. I had 2 Desktops (with floating windows), and everything else was fullscreen.  This was largely how I worked previously in Awesome (full screen IDE or terminal w/ tmux, visor terminal for miscellany, and the occasional tiled terminal beside my browser for debugging).

If I can't get everything working properly in AwesomeWM, I may as well run Windows. There are some `run-or-raise` scripts I have seen for general use in X, but non-tiling window managers (without something similar to macOS's fullscreen mode) aren't really of interest to me. I can emulate what I want by pinning apps to the Taskbar and utilizing the `Meta + 1-9` keyboard shortcuts to access things quickly. Not as intuitive (or as easy of a reach) as `Meta + d` (for my dev terminal), but it is functional.

# Battery life

Writing this entry in Windows, I'm showing an estimated 5-6 hours (4h53m right now at 86%). This is with Battery Saver on and not much else going on in the background. Slightly disappointing (esp. based on Lenovo's claims), but it's not really surprising based on reviews of the Gen 1 model. It does, after all, only have an 80 Wh battery for some reason...

Meanwhile, my 2015 15" rMBP is estimating 9hr at 100% (with a battery at 80% health). Now, I know for a fact that is a lie - I get more like 2 hours of work and 3-4 hours of writing/browsing, but thath is also a four year old machine. 

## nvidia

This looks to be much improved in Linux. I need to dig into PRIME (specifically, reverse PRIME, as my TB3 ports are wired to my nVidia card) some more to see if I can get graphics switching/offloading working seamlessly. I'm not so concerned about being able to use the discrete GPU as I am about having it not sucking down precious watts while I'm unplugged. Disabling and re-enabling it is onerous, and I'd have to do that every time I dock/undock, so I don't really want to go down that path.

# wtf 

autofs fucking bones me

Windows 10 pointer lag and stutters.

# Performance

Performance is fantastic. Having 32GB of RAM is spectacular. But is it worth the inconveniences? I feel like I'm stuck in my ways, but I have been less-than-productive for a week now because I've been dicking around with shit on Linux. I can knuckle down hope that Windows gets better - and Microsoft has been improving it at a RAPID pace, or I can fight Linux. Or I can return the laptop and go back to the comfort of the last good Macbook Pro, replacing the battery and praying to Steve Jobs that Apple eventually releases hardware worth buying again. Signs point to them backing away from the failure-prone butterfly switch keyboard, but the Touchbar? I feel like it's here to stay. 

macOS is, frankly, boring at this point. And that's what I want from my OS: handle the hardware, give me a shell, and get out of the way. Linux is, in contrast, still very exciting - it's MUCH better than it was when I left four years ago, but it's still rough around the edges. If you play inside the sandbox and don't deviate, it's damn near passable, battery life notwithstanding.

Windows is boring-ish in some regards (it generally handles the hardware and gets out of the way), and it's really exciting in new ways. WSL2 is usable; WSL1 was a great beta, but it was nowhere close to usable for a vast majority of cases. As Microsoft continues to improve the developer (ahem...creator) experience, I can only hope for Windows to peak and become boring again.

There is still a lot going on in Windows - more, I feel, than macOS. Apple has strong opinions, and this makes it very easy to have a great experience - almost guaranteed. I have certainly had a few oddities in my four years on macOS, but I have probably spent less time fixing or working around those oddities than I have in the last week on Linux. 

And for me, ultimately, my laptop is a tool to get work done. I don't want to recompile kernels, chase down dependencies, and stitch together a patchwork quilt of shell scripts to ensure my laptop doesn't set my back on fire because it didn't suspend properly or cause my to go blind because the DPI didn't adjust when I plugged in my external monitor. To quote the [Three Dead Trolls in a Baggie][1], I've got a girlfriend and things to get done; the Linux OS sucks.

 [1]: https://www.youtube.com/watch?v=d85p7JZXNy8

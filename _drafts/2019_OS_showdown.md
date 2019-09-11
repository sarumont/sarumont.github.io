---
title: 2019 OS Showdown
layout: post
---

# Terminals

Some requirements here (in general order of importance):

 - fast
 - resource-efficient
 - good font rendering
 - ligature support
 - emoji support

On Linux, I found one more:

 - proper scaling

TODO: links 

I'm currently typing this in my WSL2 VM on Windows 10 in the [Windows Terminal Preview][2]. It's pretty good, and it meets most of my requirements above...

Text input feels slightly sluggish. I don't have anything really to scroll right now, so I can't validate scrolling performance. Oh, and the Windows 10 emoji input doesn't work. But it gets top marks for the rest: font rendering is beautiful, ligatures are supported, and it's consuming 25MB of RAM (comparable to Termite). 

I had completely given up on Windows until my buddy, Justin, reminded me of Windows Terminal. I had relegated knowledge of it to the back of my brain, along with the thought that it would be coming through updates to the Command Prompt. I'm glad to know that isn't the case; *this is the best terminal you can have on Windows right now.*

I couldn't find a terminal on Linux that met them all. Terminology is beautiful but it's not resource-lite nor does it scale properly (more on that later). Nothing VTE-based renders ligatures, but emoji support is fine. I settled on Termite, as it is pretty lightweight, supports emoji, and scales nicely. 

There are some others like alacritty, kitty, etc. which seem to be fast, but they generally don't scale. They also push the 100MB mark on RAM consumption just sitting there.

I used to run `st`, and I have played with it a bit, but it also doesn't render ligatures or emoji, and the kerning seems a bit off from Termite (and what I remember).

## Scaling

My new laptop is a Thinkpad X1 Extreme Gen 2 with a 4k display on the laptop itself. When at my desk, I have a Dell U3419W - a curved, 34" display at a sane 3440 x 1440. Going from laptop to external on Linux generally means that I go from normal to comically large or blindness-inducing small UI elements. 

Luckily, I found a hack: a script which will reset my DPI. This works by setting `Xft.dpi` and some other settings. Terminals like alacritty and kitty don't respect any of these (I have not dug in to see if there is something they DO respect). Terminology respects an environment variable, but that really precludes launching anything from my WM. Thus, I'm limited to GTK (and QT) apps. Hence, Termite. But Termite is VTE-based, so no ligatures. 

# Window Management / Workflow

The most exciting bit about going back to Linux for me was the thought of reviving my old [AwesomeWM][3] configuration. This largely consisted of a few features:

 - a fullscreen terminal for development (running `tmux`, of course)
 - a fullscreen IDE (IntelliJ or maybe VSCode in the near future)
 - a fullscreen browser
 - a desktop where other things could float
 - a "visor mode" terminal I could access anywhere

When docked, a fullscreen browser (especially on my 34" wide monitor) is a bit much, so I will generally switch that up with a tiled layout. I've found a layout from `lain` for Awesome called `centerwork` which is perfect - master window in the center, tiling on either side of it.

Adding to that set of layouts, I had keyboard shortcuts to access everything: `Meta + i` for my IDE, `Meta + d` for my dev terminal, etc. It was efficient. On the non-fullscreen windows, I could easily move focus between windows with my keyboard. I really loved running my workflow in Awesome.

When I switched over four years ago, I emulated it as best I could in macOS with Alfred providing `run-or-raise` functionality and iTerm2 providing a visor mode. I had 2 Desktops (with floating windows), and everything else was fullscreen. I'd use macOS's split screen mode to put apps side-by-side on occasion, too.

If I can't get everything working properly in Linux with AwesomeWM, I almost may as well run Windows. There are some `run-or-raise` scripts I have seen for general use in X, but non-tiling window managers (without something similar to macOS's fullscreen mode) aren't really of interest to me - unless I could save my layouts (which should be possible with some of them). 

In Windows, I can emulate what I want by pinning apps to the Taskbar and utilizing the `Meta + 1-9` keyboard shortcuts to access things quickly. Not as intuitive (or as easy of a reach) as `Meta + d` (for my dev terminal), but it is somewhat functional.

# Battery life

Writing this entry in Windows, I'm showing an estimated 5-6 hours (4h53m right now at 86%). This is with Battery Saver on and not much else going on in the background. Slightly disappointing (esp. based on Lenovo's claims), but it's not really surprising based on reviews of the Gen 1 model. It does, after all, only have an 80 Wh battery for some reason...

In Linux, I have dropped 50% in just a short 1h45m of general web work and editing this post in vim. Sad trombone.

Meanwhile, my 2015 15" rMBP is estimating 9hr at 100% (with a battery at 80% health). Now, I know for a fact that is a lie - I get more like 2 hours of work and 3-4 hours of writing/browsing, but that is also a four year old machine with an aging battery. 

## nvidia

This looks to be much improved in Linux. I need to dig into PRIME (specifically, reverse PRIME, as my TB3 ports are wired to my nVidia card) some more to see if I can get graphics switching/offloading working seamlessly. I'm not so concerned about being able to use the discrete GPU as I am about having it not sucking down precious watts while I'm unplugged. Disabling and re-enabling it is onerous, and I'd have to do that every time I dock/undock, so I don't really want to go down that path.

It appears that the default configuration with the proprietary nVidia driver leaves the card disabled, however, as `powertop` doesn't report it consuming anything. This is great news and a welcome advance in the world of Linux Laptops.

# wtf 

Some weird and supremely frustrating issue I have found:

 - there appears to be no way to gracefully handle a lost network mount in Linux. I have `autofs` set up to automagically mount my NAS shares. But the minute my WiFi drops or I pack up and leave the house without unmounting, I can no longer access `/media` in any way: any attempt hangs my terminal. `umount -f` doesn't actually force-unmount. I cannot re-mount the share later. The only recourse is to pull a Windows and reboot. WTF?
 - Windows 10 general input latency. My mouse will jump around the screen rather than moving smoothly. Input is slow. I believe this can be tied to DPC latency which I have confirmed to be an issue. How something like this can still happen on modern hardware is inexcusable.

# Performance

Performance is fantastic. Having 32GB of RAM is spectacular. But is it worth the inconveniences? I feel like I'm stuck in my ways, and I have been less-than-productive for a week now because I've been dicking around with shit on Linux and Windows. I can knuckle down and hope that Windows gets better - and Microsoft has been improving it at a RAPID pace - or I can continue to battle Linux. Or I can return the laptop and go back to the comfort of the last good Macbook Pro, eventually replacing the battery and praying to Steve Jobs that Apple eventually releases hardware worth buying again. Signs point to them backing away from the failure-prone butterfly switch keyboard, but the Touchbar? I feel like it's here to stay, and I can't imagine not having my physical function keys. I have a hacky workaround, though:

![KB on KB action]({{ site.baseurl }}/images/kb_on_kb.jpg)

The Thinkpad keyboard is, in my experience, still unmatched. I am in heaven typing on this laptop, and I have already re-acclimated to having a TrackPoint. Next to even the 2015 Macbook Pro's keyboard, this is in a completely different league. That is one of the reasons I chose the X1 Extreme over the extremely popular Dell XPS 15. The other main issue is build quality, which has seemed to plague the XPS 15 since its inception.

# Motion in the OS Ocean

macOS is, frankly, boring at this point. And that's what I want from my OS: handle the hardware, give me a shell, and get out of the way. Linux is, in contrast, still very exciting - it's MUCH better than it was when I left four years ago, but it's still rough around the edges. If you play inside the sandbox and don't deviate, it's damn near passable, battery life notwithstanding.

Windows is boring-ish in some regards (it generally handles the hardware and gets out of the way), and it's really exciting in new ways. WSL2 is usable; WSL1 was a great beta, but it was nowhere close to usable for a vast majority of cases. As Microsoft continues to improve the developer (ahem...creator) experience, I can only hope for Windows to peak and become boring again.

There is still a lot going on in Windows, though - more, I feel, than macOS. There are a lot of ways to do things, and Windows 10 feels much more "in your face" than macOS.

Apple has strong opinions, and this makes it very easy to have a great experience - almost guaranteed. I have certainly had a few oddities in my four years on macOS, but I have probably spent less time fixing or working around those oddities than I have in the last week on Linux and Windows.

# Conclusions

For me, ultimately, my laptop is a tool to get work done. I no longer want to recompile kernels, chase down dependencies, and stitch together a patchwork quilt of shell scripts to ensure my laptop doesn't set my back on fire because it didn't suspend properly or cause my to go blind because the DPI didn't adjust when I plugged in my external monitor. To quote the [Three Dead Trolls in a Baggie][1], I've got a girlfriend and things to get done; the Linux OS sucks.

This is the general reason I switched to macOS in the first place: I was tired of hacking shit to get my environment working. I wanted to be able to sit down, open my laptop, and get shit done, full stop. I care about doing many more things than tweaking the everloving fuck out of TLP to eek out a few extra minutes on battery, digging into Xorg logs to figure out why the hell I can't read the text on my screen, and trying to figure out why anything goes wrong in Windows.

And so...as I sit writing this (now in Linux), I am seriously contemplating returning this beautiful device and crawling back to the cool, aluminum embrace of my 2015 MBP, hoping that one day soon Apple will wake up from its nap and build a real Pro laptop again, with a reliable and usable keyboard. Or, barring that, giving Microsoft some time to refine its efforts at building an exceptional developer experience.

 [1]: https://www.youtube.com/watch?v=d85p7JZXNy8
 [2]: https://github.com/microsoft/terminal
 [3]: https://awesomewm.org

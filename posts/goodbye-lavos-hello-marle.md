---
title: 'Goodbye, lavos. Hello, marle.'
date: '2014-03-18'
description:
categories: ['technology']
tags: ['linux', 'laptops']
---
{{# javascripts.load }}
jquery-1.10.2.min.js
lightbox-2.6.min.js
{{/ javascripts.load }}
{{# stylesheets.load }}
lightbox.css
{{/ stylesheets.load }}

After almost two years of venerable service, I am retiring lavos. May he live on in the hands of
whomever purchases him on eBay. lavos is a [Sager NP9150 (Clevo P150EM)][1]. He is powerful and
beastly, much like [his namesake][2]. But after much research and some recent travel, I have decided
that my days of lugging around a boat anchor are over.

## Mobility

In [my previous blog entry][3], I debated the merits of the current generation of laptops relative
to my needs. My travel after writing this entry pushed me out of the middle of the road and toward
mobility. Adding some more research, I discovered and decided upon the [Asus Zenbook Infinity][4]

Weighing in at 3.09lbs, the laptop is handily under half the weigth of lavos. Even with the power
adapter, it barely tops half of lavos and is still under half of lavos + power adapter.
Additionally, it is small enough to fit in my [Tom Bihn Imago Messaging Bag][9], which is my go-to
for short jaunts around Denver.

## Performance

Aside from the Late-2013 Macbook Air, this is the only laptop I could find with the [Intel
i7-4558u][5] processor. With a 28W thermal envelope and Iris 5100 graphics, I made the leap of faith
that performance would not take a large hit. Indeed, the main [nuvos SDK][6] codebase compiles in
the same time as my previous i7-3610QM. 

Editor [Michael Larabel][7] at [Phoronix][8] recently made the switch to the Zenbook. He has
promised benchmarks, and so I leave it in his capable hands. If he doesn't put up or doesn't include
the Linux Kernel compile benchmarks in the [Phoronix Test Suite][10], I will.

In my thus-far limited testing, virtual machines run very well, too. I will probably have to adjust
my usage, though, as I have gone from 8 cores to 4 and 16GB of RAM to 8.

## marle

Continuing my Chrono Trigger-based naming scheme, the Zenbook has been dubbed Marle. The laptop is
indeed beautiful, so it is a fitting name in my mind. I'll have to move to a different video game
for my next machine, however, as I have now used all PCs (and lavos) from CT.

## Obligatory Unboxing

Here are some obligatory unboxing photos:

<div class="center">
<a href="{{urls.media}}/marle/unboxing1.jpg" data-lightbox="marle" title="The box">
<img src="{{urls.media}}/marle/thumbs/unboxing1.jpg" title="The box" />
</a>
<a href="{{urls.media}}/marle/unboxing2.jpg" data-lightbox="marle" title="Don't be shy...">
<img src="{{urls.media}}/marle/thumbs/unboxing2.jpg" title="Don't be shy..." />
</a>
<a href="{{urls.media}}/marle/unboxing3.jpg" data-lightbox="marle" title="Everything">
<img src="{{urls.media}}/marle/thumbs/unboxing3.jpg" title="Everything" />
</a>
<a href="{{urls.media}}/marle/unboxing4.jpg" data-lightbox="marle" title="Opened">
<img src="{{urls.media}}/marle/thumbs/unboxing4.jpg" title="Opened" />
</a>
</div>

## Impressions

I really like this laptop. The keyboard is solid (not Thinkpad-solid...); the screen is gorgeous.
The battery life should be in the 5+ hour range in Linux (I haven't fully tested this yet). Performance is perfectly sufficient for development.

## Linux

Obviously, the first thing I had to do was install Linux. This experience was like a throwback to
the days when Linux barely worked on some things.

### RAID

One of the "features" of the Zenbook is that it contains two M.2 SATA Drives, striped in "RAID" for
performance. This is all well and good, but as any \*nix guy knows, this is just bullshit software
RAID. Once I had my Lubuntu USB drive booting, I blew away the RAID. From what I saw, however, this
RAID was implemented using LVM. I probably could have salvaged it had it not been for UEFI...

### UEFI

What unholy mess is this? I had not installed Linux onto a UEFI system yet, so natuarally I had my
work cut out for me. I'm pretty sure I actually needed a 512MB UEFI partition for grub to
successfully install, but that could have just been a grub bug, too.

### RAID (again)

I decided I *wanted* the benefits of software RAID striping, so I set up my own LVM partition(s). I
ended up with a 256MB /boot, 512MB /boot/efi, and the remainder for LVM on each drive. I leveraged
[this tutorial][12] to get my LVM set up.

### LUKS

The other spanner in the works was full-disk encryption. This required me to have a separate /boot
partition. I also had to manually copy /etc/crypttab to my fresh install, chroot to it (on the USB
disk), and rebuild my initrd because I had to use the Ubuntu installer's manual disk partitioning
mode (with the EFI and LVM clusterfuck).

### Beta

On top of all of this, I decided we were close enough to April to use a beta 14.04 installer. *If
you ever do this I highly recommend you allow install-time updates.* I'm fairly certain this fixed
a grub bug which eventually allowed me to complete my installation (at about 0400).

### Victory!

At the end of the day, I got what I wanted: Linux boots with UEFI to an LVM-striped, LUKS-encrypted
Lubuntu installation which I have stripped down and installed [Awesome][11] on.

From what I have tested thus far, everything works: 

- I am using the USB 3.0 Ethernet adapter (and have sustained 30MB/s reads from the old laptop over
  GigE)
- the webcam works
- miniDP -> DisplayPort is functional
- the trackpad works fine (synaptics - two-finger scrolling, etc are configurable)
- the touchscreen works (I'm using [ginn][14] for basic touch)
- sound works
- I can adjust the screen backlight [using this trick][13]
- suspend and resume work flawlessly

I have not tested Bluetooth, but I saw messages in dmesg about Bluetooth drivers when using `Fn+F2`
to see what it did (it's the 'disable wireless' combo). The keyboard backlight is not working
either, but that is of no major concern to me.

I have most everything set up now, so marle is now my daily driver. I'm very pleased thus far, and
we should have a good run together!


 [1]: http://www.amazon.com/Clevo-P150EM-Sager-NP9150-Gaming/dp/B00C76CBNY/ref#cm_cr_pr_product_top/181-0798509-6227119
 [2]: http://chrono.wikia.com/wiki/Lavos
 [3]: http://www.sigil.org/2014/02/the-sad-state-of-laptops-2014/
 [4]: http://www.asus.com/zenbook/#infinity
 [5]: http://www.notebookcheck.net/Intel-Core-i7-4558U-Notebook-Processor.93588.0.html
 [6]: http://www.nuvos.com
 [7]: http://www.michaellarabel.com/michael.php
 [8]: http://www.phoronix.com/scan.php?page#news_item&px#MTYyNTE
 [9]: http://www.tombihn.com/PROD/TB0810.html
 [10]: http://www.phoronix-test-suite.com/
 [11]: http://awesome.naquadah.org
 [12]: https://help.ubuntu.com/community/StripedVolumeHowTo
 [13]: http://ubuntuforums.org/showthread.php?t#2193133&page#3&s#ceb2c536838c0a2ca138fc57f12872a6
 [14]: https://wiki.ubuntu.com/Multitouch/Ginn

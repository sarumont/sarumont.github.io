---
title: 'An Audio Odyssey'
description: Whole-house audio, self-hosting, and owning music in the age of streaming.
categories: ['audio', 'music', 'homelab']
---

I consider myself a practical audiophile, a [music-first][1] audiophile, if you
will. I realize that, to many, this is an oxymoron. But I love music and want 
to experience it as best as I can. I do *not*, however, want to sell a kidney 
to get the absolute best equipment when I cannot discern a difference between
"good enough" and "the absolute best" (except for the difference in my checking
account balance).

# A Journey Towards a Whole-House System

I've always dreamt of a whole-house audio system. I'm not entirely sure why, but
I have. For the longest time, my audio system was always my computer. I had a
good set of speakers and played music with Winamp (you know, [it really whips the
Llama's ass][2]). When I switched to Linux, I replaced Winamp with XMMS, an
open-source Winamp copycat. At some point after this, I discovered [`musicpd`][3] 
and stuck with it for a long time.

13ish years ago, my dad and I were tossing around the idea of digitizing his
entire CD library such that he could play it in the house and control it from
his phone. This was in the early days of the Raspberry Pi, so I came up with a
solution involving a Synology NAS, [EAC][4], and a Pi. The Pi would be hooked up
to a [Schiit Modi DAC][5] which in turn acted as an input to his HiFi system.
Musicpd formed the backbone, along with an Android app to control it. After a
bit of configuration and much CD ripping, DadFi was born.

## Evolution

While this system was in use at my parents' house, I wound up with a single
Sonos Play:1 speaker in my kitchen. I still listened to music via musicpd at my
desk, but I had begun to play with streaming, signing up for a Spotify account
to replace the recently EOL'd [Google Play Music][6]. What I was missing was a
way to play my extensive collection of digital music on said Sonos speaker.
Enter: Logitech Media Server.


# The Plan

I decided that the cabin needed sound in each bedroom, the kitchen, and outside. Since there was a porch out front and a planned deck in the back, this totalled six zones. I wired all these rooms with some 18ga speaker cable (as well as CAT6 and coax) before closing them up and went about planning out the system.

After a bit of research, I decided on a Dayton Audio <model number here>. With six independent zones, I would be set for the cabin. For the kitchen ceiling, I went with a pair of Polk Audio <model number here>. My initial plan was to get the kitchen and the front porch zones wired up first, as those are the most used locations in the house.

I planned to used Raspberry Pis (and DACs) for input sources, but this was before the Great Raspberry Pi Drought, which seems to be still ongoing.

## Moving

As the cabin build came to a close, my wife and I sold our house and moved. Lo and behold, our new house had been wired for sound: speakers in the kitchen, speakers out on the back patio, and speakers in the primary bathroom. There is also evidence that the upstairs bonus room had been wired at one point, though the speakers are no longer in there.




https://alsa.opensrc.org/Udev#A_working_example

udev output:

Run the following command:

    udevadm monitor --kernel --property --subsystem-match=sound

Now plug in your DAC. You will be met with output that looks like:

    KERNEL[85368.383853] remove   /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.5/1-1.5:1.1/sound/card2/controlC2 (sound) 
    ACTION=remove
    DEVPATH=/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.5/1-1.5:1.1/sound/card2/controlC2
    SUBSYSTEM=sound
    DEVNAME=/dev/snd/controlC2
    SEQNUM=2290
    MAJOR=116
    MINOR=64

The key takeaway here is the `DEVPATH` section. This will 

Reload your udev rules:

    sudo udevadm control --reload-rules && sudo udevadm trigger

I never had success with `udev` renaming the audio device via `trigger`, so I had to unplug and re-plug all my DACs. The result should be something like this from `aplay -L`:

    null
        Discard all samples (playback) or generate zero samples (capture)
    default
        Default Audio Device
    sysdefault
        Default Audio Device
    default:CARD=kitchen
        FiiO USB DAC-E10, USB Audio
        Default Audio Device

    ...

    default:CARD=lanai
        FiiO USB DAC-E10, USB Audio
        Default Audio Device

    ...

    default:CARD=master_bath
        FiiO USB DAC-E10, USB Audio
        Default Audio Device

Sirius XM && Custom init script for LMS


https://forums.slimdevices.com/forum/user-forums/general-discussion/1652350-sirius-xm-and-tune-in-url/page9

https://bit-101.com/blog/posts/2025-03-29/plex-navidrome-symfonium/
https://www.jimwillis.org/2024/12/08/adventures-in-self-hosting-hifi-audio-streaming/


Goddamn. I thought I had it as close to perfect as I could get. But no.

I've been running Roon for my audio for the past 2 months now, got my dad using it for mobile (via their mobile app, Roon ARC). It gives you a unified view of your music plus either Qobuz or Tidal as a streaming service. Great. Whole home audio? Check. So it replaces Lyrion in my house. You still need 2 apps, unfortunately (Roon for "home mode", Roon ARC for "away mode")...but it's a unified library, shared view between the apps, etc. (so your play history and thus suggestions are all the same between the two). As a bonus, it has great editorial content inside the app, so you can deep dive through a review or to find similar artists / influences. Or another recording where X person was involved (i.e. - I want to hear more of this drummer. Very useful for jazz).

Dad is getting ready to fly out here for our annual ski trip. He asks me how to download music in Roon ARC for offline listening...I go to demonstrate, and it is not possible to do for content that is NOT in your personal library - i.e. content from the streaming provider. This is one of the big use-cases for me with the kids since they have iPods. Fucking shitty.

[1]: https://darko.audio/2024/05/the-music-first-audiophile-manifesto/
[2]: https://www.youtube.com/watch?v=WqJbvZVGWSE

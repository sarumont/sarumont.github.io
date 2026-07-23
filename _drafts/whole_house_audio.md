---
title: 'A Whole-House Audio Odyssey'
categories: ['audio', 'music', 'homelab']
---

I consider myself a practical audiophile, a [music-first][1] audiophile, if you
will. I realize that, to many, this is an oxymoron. But I love music and want 
to experience it as best as I can. I do *not*, however, want to sell a kidney 
to get the absolute best equipment when I cannot discern a difference between
"good enough" and "the absolute best" (audibly - the difference in my checking
account balance is quite discernible).

# A Journey Towards a Whole-House System

I inherited all of this from my father: my love of music itself, my respect for
so-called high fidelity, my desire to do the music I love justice with the
equipment I enjoy it on. I grew up in a house with a Harman Kardon Citation 16
and 17 amp/pre-amp stack. Various speakers ranging from ARs to Dahlquist.
Respect for the discs I had to be trained to handle lest they become scratched
(I never handled the vinyl).

Becoming interested in tech along the way, I developed my own dream of a 
whole-house audio system. I'm not entirely sure why, but I have. 

For the longest time, my audio system was always my computer. I had a
good set of speakers and played music with Winamp (you know, [it really whips the
Llama's ass][2]). When I switched to Linux, I replaced Winamp with XMMS, an
open-source Winamp copycat. At some point after this, I discovered [`musicpd`][3] 
and stuck with it for a very long time.

A decade and a half ago, my dad and I were tossing around the idea of digitizing his
entire CD library such that he could play it in the house and control it from
his phone. This was in the early days of the Raspberry Pi, so I came up with a
solution involving a Synology NAS, [EAC][4], and a Pi. The Pi would be hooked up
to a [Schiit Modi DAC][5] which in turn acted as an input to his HiFi system.
Musicpd formed the backbone, along with an Android app to control it. After a
bit of configuration and much CD ripping, DadFi was born.

## Evolution

While this system was in use at my parents' house for many years, I continued using 
musicpd daily on my computer while working and hanging out, as it was generally
in the living space of my home or apartment. At some point, I added a home
theater PC running XBMC which became Kodi, thus relieving my PC from music duty
for the home.

Building a family saw my decor and social habits change, and so I wound up with a single
Sonos Play:1 speaker in my kitchen. I still listened to music via musicpd at my
desk, but I had begun to play with streaming, signing up for a Spotify account
to replace the recently EOL'd [Google Play Music][6]. What I was missing was a
way to play my extensive collection of digital music on said Sonos speaker.
Enter: Logitech Media Server.

## LMS

Looking back, Logitech Media Server was and still is a fantastic piece of tech.
The Squeezebox hardware which Logitech made to accompany it seems to have been
great, and a lot of it is still in use. When Logitech closed the project down,
the media server and protocol were open-sourced. The community maintained it,
improved it, expanded it. When I started playing with it, it had grown beyond
Squeezboxes and your local music library: you could connect it to your Spotify,
too. It had a modern interface in the Material Skin. It was, in a word, perfect
for whole-home audio. The Squeezelite protocol supported synchronized multi-zone 
playback, allowing the same song to be synchronized across all your speaker
zones.

And so I used it myself for a while, vetting it with the Sonos, and then I
upgraded DadFi. My father still only had a single zone, but when my parents
eventually moved out of my childhood home, we added a second and third, so the
move to LMS paid dividends.

A little over three years ago, I also moved. Our new home thankfully had several
speaker zones wired, so I really had little to do to achieve my whole-house
audio system dream. I replaced the dead receiver the previous owner had left in
the house, as it had developed a serious buzz from some blown caps (it was left
on 100% of the time in the heat of the garage utility closet). My new amp, a
Dayton Audio <model> with six zones, has an automatic standby feature to preserve
its components.

As for the endpoints? I had started dabbling with a homelab (again) at this point, 
so I found some budget USB DACs (FiiO E10s) on eBay and hooked them up to a
Linux server.

# Linux and LMS

Due to the open nature of the protocol, there is a simple piece of software
called `squeezelite` which can provide a player for LMS. All I had to do was to
sort out which DAC went to which zone. This required a little `udev` hackery to
name the audio devices in a human-friendly manner:

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

The key takeaway here is the `DEVPATH` section. This will end up in a udev
`rules.d` entry, giving that specific device a unique name.

```
TODO: rescue the rules.d entry...
```

Now reload your udev rules:

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

With distinct device names per zone, I am in business. I created a separate
`systemd` unit per zone to run `squeezelite`. Note that you need a distinct MAC
address per endpoint, so you'll have to fake one with the `squeezelite` config:

```
TODO: grab squeezelite config
```

# Audio Nirvana

Finally, after all these years, I had a whole-home audio system, complete with
my local music library, Spotify streaming, and (eventually) SiriusXM 
integration. I had synchronized playback. I had a nice interface on my phone 
and the tablet I now have permanently mounted in the kitchen.

Was it "HiFi"? Hell no. I have in-ceiling speakers in the kitchen and master
bath. And the acoustics are awful in both rooms. The outdoor speakers are
actually pretty nice but again - they are outdoor speakers. But I have music
where it matters.

I still have a good pair of headphones, DAC, and amp on my desk. But when I'm 
cooking dinner, entertaining, or just hanging out with my family, I have 
music to enjoy and share. And THAT is what it's all about. 


[1]: https://darko.audio/2024/05/the-music-first-audiophile-manifesto/
[2]: https://www.youtube.com/watch?v=WqJbvZVGWSE
[3]: https://www.musicpd.org/
[4]: https://www.exactaudiocopy.de/
[5]: https://www.schiit.com/products/modi-5
[6]: https://en.wikipedia.org/wiki/Google_Play_Music

---
title: Perfect Linux Audio
---

As a dabbling audiophile, I've never been able to get my audio setup completely perfect. I need to
balance my everyday - music while coding, Skype calls, browser audio (TED, Youtube, Hangouts) -
with the ability to listen to audio without software mixing when desired.

With the buildout of [marle][1], I believe I have my setup as close to perfect as can be.

# Hardware

I use my laptop's microphones all the time. The wrench in the works, however, is the desire to use
my [USB DAC][2] while at my desk and my laptop's soundcard when I'm mobile.

# High Quality

The world of high-quality audio is an unmitigated rabbit hole. Without restraint, you will quickly
acquire a collection of headphones, DACs, amps, and a heaping pile of debt to go with it. 

The long and short of it, however, is that you want the highest quality audio (uncompressed files,
higher bitrates) you can find presented to the highest-quality DAC you have access to. This is where
computers make it tricky. To be able to listen to the meowing of that cute cat on Youtube while chatting with
your sister on Skype requires your operating system to mix audio streams on your behalf. Once this
happens, you have already lost the quality battle.

For software to mix disparate audio streams, they must be resampled to the same frequency and
bitrate. This mixed stream is then sent to your DAC (be it onboard sound or an external device). If
your source material (music) is at a different bitrate than the remixed rate, the source has to be
resampled in software before being sent to your DAC. This added step has the potential to drop the
final analog quality substantially.

To ensure that software only transmits the source material, one bit at a time, to your DAC, your
music player must directly and exclusively access the hardware. By doing this, you can no longer mix cat videos and
your sister's Skype call.

Without using two sets of speakers/headphones, you must have the ability to give your music player
exclusive access to your DAC, preferably without too much hassle.

# Switching

To be able to switch between desktop mode and audiophile mode, 
I [wrote a script][4] to tell [MPD][5] to use either the mixed output or access my DAC directly.
Running a script when I want to listen to my music in all its glory is fine by me, as this is
typcially a once-per-day affair at the most.

# ALSA

Previously, I had a close-but-not-perfect ALSA-only setup. I followed the [Two Cards as One][3]
guide with much success. Some applications, however, ignored ALSA and grabbed the hardware anyway
(VirtualBox, WINE). Chrome also had a tendency to have an open channel on some tab preventing my
mpc switching script from working.

Additionally, this setup no longer works on marle when I disconnect the DAC (i.e. when I'm mobile).
I'm not sure if this is due to an ALSA update or the fact that it never should have worked.

# PulseAudio

Ugh. I have avoided PulseAudio like the plague throughout my entire life running Linux and FreeBSD
on my desktop. It had some serious growing pains, and it always seemed to break more than it fixed.
Alas, it is, in theory, the best solution for this application.

## Combined audio

Open up `/etc/pulse/default.pa` and add:

```
load-module module-combine-sink sink_name=combined
set-default-sink combined
```

Now, restart pulse:

```
killall pulseaudio
```

And bask in the glory of PulseAudio actually doing something useful.

## Switching

If nothing is using Pulse, my `mpc_switch` script works a treat. If not, there is luckily a handy
utility to suspend Pulse:

```
pasuspender -- sleep 365d
```

You're supposed to provide an app to `pasuspender`, so I just leave it hanging in a terminal with
sleep (for now) and kill it when I'm done with my listening session.

## Speakers

By default, this setup is outputting to my DAC + headphones as well as my laptop speakers. This is
slightly annoying, but I already have a "docking script" which runs when I connect/disconnect my
external monitor. It's a simple matter to mute/unmute the onboard sound as appropriate with:

```
pacmd set-sink-mute alsa_output.pci-0000_00_1b.0.analog-stereo 1
```

You can find your sink name via:

```
pacmd list-sinks | grep name:
```

## mpd

I was running mpd as a system daemon, and this obviously doesn't work with the PulseAudio model. The
mpd user fired up its own Pulse, and nothing worked. To remedy this, I simply start mpd from my user
account.

```
cp /etc/mpd.conf ~/.mpd.conf
<edit user and group>
mpd ~/.mpd.conf
```

Cheers!

**Edit:** Shortly after publishing this post, I discovered that I can easily suspend PulseAudio
using `pactl`. I have updated my `mpc_switch` [script][4] to eliminate the `pasuspender` step. w00t!

 [1]: http://www.sigil.org/2014/03/goodbye-lavos-hello-marle/
 [2]: http://www.amazon.com/gp/product/B0070UFMOW/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0070UFMOW&linkCode=as2&tag=sigilorg-20
 [3]: http://alsa.opensrc.org/TwoCardsAsOne
 [4]: https://github.com/sarumont/dotfiles/blob/master/bin/mpc_switch
 [5]: http://www.musicpd.org/

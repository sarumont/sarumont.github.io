I consider myself a practical audiophile. I realize that, to many, this is an oxymoron. But hear me out: I love music and want to experience it as best as I can. But I don't want to sell a kidney to get the absolute best equipment. I'm happy to apply the Pareto Principal.

My dream has always been a whole-home audio system, ever since my days running low voltage cabling. This became a possibility when my in-laws were looking for a retirement house here in Colorado, closer to my wife and her sister. They found a cabin near us that was a work-in-progress: finished on the outside, roughed-in on the inside. Having plenty of carpentry experience, I volunteered to finish the cabin off for them, helping to make it possible for them to retire to a higher cost-of-living location.

Now, I love working with my hands. There is a joy to be found there that cannot be found with a keyboard, no matter what I create through that means. But the thing that stood out to me? Rough walls. The opportunity to run cables for what I want, where I want. And what I wanted was integrated whole-home audio.

# My Audio

My personal audio setup had long been musicpd, a USB DAC, and a headphone amp. I had set up a system for my father based on that premise, though I piped his DAC into his HiFi stereo system. Now, I had need of something more robust.

At the time, I had a single Sonos Play:1 speaker in my kitchen. I had played around with audio software, discovering Roon and Logitech Media Server in the process. I decided that either of these would foot the bill.

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

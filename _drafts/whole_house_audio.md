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

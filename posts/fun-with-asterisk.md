---
title: 'Fun with Asterisk'
date: '2009-11-09'
description:
categories: ['technology']
tags: ['asterisk', 'voip']
permalink: '/technology/fun_with_asterisk'
---
I spend approximately 10-15% of my time wearing the IT hat for both my company and the company whom we are currently consulting. We are running FreePBX for both companies' phone systems. Our setups are relatively simplistic, so I have had little problems managing everything. The first real hurdle I ran into was the inability of Asterisk to allow the same extension to log on from multiple devices. I'm pretty sure this is not a SIP restriction, but I may be wrong. Either way, my goal is not to bash FreePBX or Asterisk.

Initially, I over-engineered a solution to this problem while simultaneously making it more difficult to administer and use. The setup required a ring group for each user's extension. This ring group contained an extension for each phone the user needed. To have a common voicemail box, there was yet another extension for voicemail. Convoluted? Yes, it was. It did work, however, for our use-case. We have three employees, and only one of us needed a multi-homed extension at the time. I set it up and forgot about it.

More recently, I set up another FreePBX system for our customer. At this point, I discovered the Follow-Me module. The original point of using this module was to allow calls to ring through a user's mobile phone. I also adapted my previous abomination to use Follow-Me, making for a much simpler setup. It was simpler, yes, but it was still a bit convoluted.

This system worked well until I was tasked with on-demand call recording. I determined how to enable this in a jiffy with some quick Googling. The problem? Access to these recordings was tied to the extension that initiated the recording.

To solve this, I re-visited `deviceanduser` mode in FreePBX. This is the route I should have taken in my earlier ventures - it decouples devices and users. A device can register via SIP to the server, and a user represents an extension and voicemail box. This can be enabled by setting `AMPEXTENSIONS=deviceanduser` in `/etc/amportal.conf`. Be sure to comment out the existing setting.

To enable on-demand recording, add 'w' to the dial command string and 'W' to the outbound dial command string. These settings are found in General Settings in the FreePBX UI.


Add the following to `/etc/asterisk/features_general_custom.conf`:

    featuredigittimeout=3000
    courtesytone=beep
    

This makes sure the PBX will register your keypress (waiting for up to 3 seconds) and beeps to confirm. Feel free to disable the beep.

To enable access to the recordings from the ARI:

    ln -s /var/spool/asterisk/monitor/ /var/www/html/recordings/monitor
    yum install sox
    

Finally, tie everything to the user. For every device a user has, add the user's extension in the `accountcode` field on the device. Edit `/var/www/html/recordings/modules/callmonitor.module`. Add:

    OR accountcode = '" . $_SESSION['ari_user']['extension'] . "'
    

After the line:

    OR dst = '" . $_SESSION['ari_user']['extension'] . "'
    

On my FreePBX, this was at line 614.

Now, all calls recorded from any device for a given user will show up in that user's ARI for download.

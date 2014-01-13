---
title: 'Xorg Monitor Hotplugging'
date: '2012-09-14'
description:
categories: ['technology']
tags: ['linux', 'xorg', 'xrandr']
permalink: '/technology/:title'
---
There are actually a few things Windows does that I actually would like Linux to do. As I run into these inconveniences, I eventually (attempt to) solve them. The latest in this saga is monitor hotplugging. Windows guys undock their laptops and magically have everything move to one screen; they dock the laptop later and have the external monitor fired up and ready to go. 

# Primitive Solution 

Luckily for me, the newer Kepler-based Optimus laptops aren't completely broken in Linux. All the outputs are hooked up to the Intel card, and the nVidia card provides 3D acceleration via [black magic][1]. Given this physical connection, xrandr Just Works (tm), and my initial solution to this problem was a set of aliases: 

	24on='xrandr --output DP3 --right-of LVDS1 --mode 1920x1200'
	30on='xrandr --output DP3 --right-of LVDS1 --mode 2560x1600'
	ext_off='xrandr --output DP3 --off'

I could have condensed the 'on' aliases to both use --auto rather than the --mode switches, but that is neither here nor there. 

# Evolving

Today, the straw broke the camel's back, and I was bound and determined to automate this. After a bit of research, I came across 
[a question on StackOverflow][2] that started me down the right path. After hitting up [the udev documentation][3], I had a solution using a udev rule:

	ACTION=="change", SUBSYSTEM=="drm", ENV{HOTPLUG}=="1", RUN+="/bin/su -l sarumont -c /home/sarumont/.common/base/bin/display_switch"

to fire a script: 

	#!/bin/sh
	 
	connected=`cat /sys/class/drm/card0-DP-3/status`
	 
	export DISPLAY=":0.0"
	if test $connected = "connected"; then
		xrandr --output DP3 --right-of LVDS1 --auto
	else
		xrandr --output DP3 --off
	fi

And Voila! My external monitor is automagically enabled when I plug in and disabled when I go mobile.

 [1]: http://catb.org/jargon/html/B/black-magic.html
 [2]: http://stackoverflow.com/questions/5469828/how-to-create-a-callback-for-monitor-plugged-on-an-intel-graphics
 [3]: http://reactivated.net/writing_udev_rules.html#external-run

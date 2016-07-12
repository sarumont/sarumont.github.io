---
title: 'Twice the bits, twice the time'
date: '2010-09-02'
description:
categories: ['coding', 'technology']
tags: ['freebsd', 'java']
permalink: '/technology/twice_the_bits_twice_the_time'
---

When I built a zfs-based RAID array last year, I switched to the 64-bit build of FreeBSD. Knowing that 64-bit software is inherently evil, I set up a 32-bit jail for coding. At some point, I was dragged into doing UI work requiring GWT's devmode. I took the easy way out - abandoning my jail. Comparing compile-time numbers to a new machine a colleague built yesterday, it occurred to me to try a 32-bit JDK. My work revolves around our codebase and our customer's codebase. Both are architected in a very minimalistic fashion, using ant to build. There are a couple xjc tasks, some javac annotation preprocessing and some code generation, but the bulk of the build process is pure javac. I'll shutup now; you're here for the numbers. Here they are ('real' time from [time](http://www.freebsd.org/cgi/man.cgi?time)): 

## 64-bit OpenJDK 6 b20, FreeBSD 8.1-STABLE

### Codebase 0:

	18.36 real
	17.59 real
	17.57 real
	18.60 real
	17.97 real
	------------
	(avg: 18.02)

### Codebase 1:

	23.06 real
	23.37 real
	22.34 real
	22.64 real
	22.34 real
	------------
	(avg: 22.75)

## 32-bit OpenJDK 6 b20, FreeBSD 8.1-STABLE

### Codebase 0:

	12.99 real
	13.64 real
	12.77 real
	12.38 real
	12.42 real
	------------
	(avg: 12.84)

### Codebase 1:

	15.35 real
	15.44 real
	15.20 real
	15.17 real
	15.14 real
	------------
	(avg: 15.26)

Compiling with a 64-bit javac is 140% and 149% SLOWER than the 32-bit javac. Roughly 1.5x! How much time have I wasted compiling with a 64-bit javac during the last year? I don't want to approximate that math. If I worked in a real office, I'd [have a reason](http://www.xkcd.com/303) for compiling with 64-bit javac. Needless to say, `JAVA_HOME` has already been changed. If there's a more general point to be had here, it would be that those extra bits can indeed affect performance in a human-perceivable and negative fashion. Always be sure to evaluate your tools to determine where you are wasting time.

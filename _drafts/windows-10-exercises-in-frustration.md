---
title: Windows 10&#58; Exercises in Frustation
layout: post
---

A couple things I have found playing with WSL in yet another attempt at using Windows for development:

 - WSL is still slow, and it feels like that limitation is I/O (haven't dug into the bowels to confirm). 
 - I/O is *awful* with the metadata-mounted drvfs. Try something like 'git status' (which makes a LOT of stat() calls) on a WSL-native git tree vs a shared git tree via metadata mount.
 - Mounting with the metadata option on, I can no longer launch Windows executables. This *must* be a bug, but I haven't yet figured out a workaround.

Compiling in WSL on a metadata-enable drive: 16:07, 16:42, 16:32
Compiling in WSL on the WSL filesystem: 14:43, 13:33, 13:28
Compiling in native Windows: 10:20, 10:25, 10:15

https://www.phoronix.com/scan.php?page=article&item=wsl-february-2018&num=6
https://brianketelsen.com/going-overboard-with-wsl-metadata/

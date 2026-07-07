---
title: 'Announcing: sxm-streamer'
layout: post
categories: music
---

I've made the jump to [Roon](https://roon.app) for at least a year for my home
music system (more on that coming at some point). One thing it was lacking over
my previous solution using [Lyrion](https://lyrion.org) was support for
streaming SiriusXM stations. No longer!

Building on the awesome work of [`sxm`](https://pypi.org/project/sxm/), Claude and
I have wrapped up a transcoding streamer for SiriusXM. You can find it [on
Github](https://github.com/sarumont/sxm-streamer) and easily get it deployed
through docker.

This allows streaming through Roon with basic metadata passthrough. The HLS
stream that the `sxm` base library produced was not something Roon could
handle, so I had to wrap it to transcode for Roon. I've been using it for a
couple months now with no issues to speak of. Please report any issues you may
find on the Github project.

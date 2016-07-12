---
title: 'Geeky Skills: Soldering'
date: '2014-03-30'
description:
categories: ['technology']
tags: ['diy']
---
{{# javascripts.load }}
jquery-1.10.2.min.js
lightbox-2.6.min.js
{{/ javascripts.load }}
{{# stylesheets.load }}
lightbox.css
{{/ stylesheets.load }}

As a boy, I never really learned to solder. I recall dad showing me some minor soldering, but this
was with a soldering gun (not iron) on wires. Much to my dismay later in life, I never learned to
solder small things: chips, circuitboards, etc.

When I started roasting coffee, I picked up an el-cheapo soldering iron from Fry's to modify a
hot-air popcorn popper by adding two switches: power and thermal protection bypass (to prevent 
the thermal protection switch from shutting off the element). My soldering job was terrible, at
best, but it worked until the popper eventually gave out.

About two years ago, my [Shure SRH840s][1] decided to switch to mono. I love these cans, but there
is a design flaw in that the wire connecting the left to the right headphone is exposed. I na studio
environment, I'm sure this is not a concern. But in my cave, this wire is constantly hitting the
headrest of my [Humanscale Freedom][2].

I quickly found a [head-fi][3] user who had experienced the same issue and successfully replaced the
wire. Naively confident I could fix it, I went to work taking my precious headphones apart. I
handily replaced the wire (with a thicker gauge) and soldered the replacement in. Both ends were
circuit boards with soldering pads. Success! Though my soldering job looked like a two year old's
coloring book.

I discovered on that job that my el-cheapo soldering iron was quite terrible. The tip of the tip did
not get nearly hot enough, so I had to lay it almost horizontal to get enough heat into my work to
melt the solder. I swore at that point that the next time I needed to solder
something, I would purchase a quality soldering iron.

Fast-forward to last week, and my Shure's right earphone started to crackle again. A bit nervous 
from my previous forays into soldering, I put in an order on Amazon. All
told, the gear I got to do a satisfactory job was still half the cost of replacing the (perfectly
working) headphones. I opted for a simple [Weller 40W iron][4], some [helping hands][5], and a few
other accoutrements to make my job easier.

I prepared myself by watching [the Pace Soldering lessons][6]. These videos may be a bit dated, but
they are still very valuable.  This weekend, I grabbed some 24AWG stranded (better flexibility than 
solid) wire from our local Radio Shack and got to work.

I'm quite proud of my connections this time. I used a desoldering wick to remove the old connections
with much success. I used a bit too much flux on the reflow (you can see the brown residue still on 
the PCB), but the joints are clean. You will also notice the melted plastic in the pictures below;
this is from my previous repair attempt with the terrible soldering iron.


<div class="center">
<a href="{{urls.media}}/soldering/right.jpg" data-lightbox="soldering" title="Right headphone">
<img src="{{urls.media}}/soldering/thumbs/right.jpg" title="Right headphone" />
</a>
<a href="{{urls.media}}/soldering/left.jpg" data-lightbox="soldering" title="Left headphone">
<img src="{{urls.media}}/soldering/thumbs/left.jpg" title="Left headphone" />
</a>
</div>

At the end of the day, a bit of skill and quality tools make all the difference in the world. I'm
glad that I now have the confidence and enough skill to fix a new class of thing in our increasingly
disposable world.

 [1]: http://www.amazon.com/gp/product/B002DP8IEK/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B002DP8IEK&linkCode=as2&tag=sigilorg-20
 [2]: http://www.humanscale.com/products/product_detail.cfm?group=FreedomTaskChairWithHeadrest
 [3]: http://www.head-fi.org/f/
 [4]: http://www.amazon.com/gp/product/B00B3SG7F0/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00B3SG7F0&linkCode=as2&tag=sigilorg-20
 [5]: http://www.amazon.com/gp/product/B000RB38X8/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B000RB38X8&linkCode=as2&tag=sigilorg-20
 [6]: https://www.youtube.com/playlist?list=PL926EC0F1F93C1837

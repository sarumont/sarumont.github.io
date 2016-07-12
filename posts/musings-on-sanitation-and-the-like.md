---
title: 'Musings on sanitation and the like...'
date: '2013-09-10'
description: this is a description
permalink: '/musings/:title'
categories:
    - homebrew
tags: ['sanitation', 'yeast']
---
As I sit here finishing the leftover beer from a night of [BJCP study][1], I am rabidly researching sanitation and infection. See, once my study group left for the night, I racked my barleywine into a keg for carbonating and bottling. I brewed said barleywine on the 7th of April, and I last tasted it on May 5th, when I racked it into secondary. My notes and memory indicate that it was nothing short of awesome at that point, if a bit young (still had some hot alcohol notes). I threatened my wife that I would throw the carboy over the balcony (onto our neighbor's balcony) should my the product of a long brew day, 20+ pounds of malt, and 5+ months of fermentation and conditioning be compromised. Luckily for them (and me, in the long run), I was just being dramatic. I can't say that the fortune cookie on the counter was as lucky...

# Saccharomyces Dickheadus

About two years ago, I had a series of brews (nine, to be exact) become infected. Nine batches of beer. In a row. I ran the gamut trying to eliminate the source of the infection. Eventually, I linked the infection to my autosiphon and/or its hose; I was siphoning my cooled wort from the brew kettle into the fermenter using my autosiphon. Since then, my brews have been largely successful on the sanitation side. I have had other issues affecting my beer quality (equipment changes, terrible recipes, etc.), but nothing that was not directly in my control. Until today. Actually, about a month ago. But I just connected the pieces back further than expected today.

My barleywine is not acidic: I don't detect lactic acid or acetic acid at all. The off-flavor is more of a medicinal chlorophenolic; it is very harsh and very unpleasant. Given this information, I set out on a research binge. Never mind that I have a metric ton of work to do before [JavaOne][2] - my body will pay for that later with sleep deprivation and caffeine overdosing. No, I cannot concentrate on coding while I have unresolved beer issues. Brewing is my relaxation, my zen. I must return balance...

Through a series of Google searches and links, I came across [a post][3] describing a very similar flavor characteristic to my barleywine. And, for that matter, a couple of my sours from two years ago. This post led me to the discovery of [saccaromyces diastaticus][4]. Wild yeast. I am sufficiently convinced that these beasties are all up in my barleywine. Fuck those guys (though I cannot fully discount dark wizards...)

# Root-cause Analysis

Throughout my brewing career, I have gone from taking great notes (for my knowledge at the time) to shite notes to almost OCD notes. The short version of my current note-taking strategy is BeerSmith recipe -> custom HTML report -> Google Docs. I then edit the brew sheet in Google Docs with notes specific to that brew. I have also started a "Brewer's Log" to catalog overarching changes to my brewery equipment and methods. This blog post started as an entry in my Brewer's Log, but I decided I had assembled enough information and knowledge to share with the world.

Since my notes on the barleywine are on the almost-OCD side, I know what fermenter it was in for primary. I know that because it was a bucket fermenter, I used my racking cane to get it into the glass carboy it has been conditioning in for the last four months. This was the first time I had used this carboy, and it came from a veteran member of my homebrew club who had heat-sanitized (possibly sterilized) it. I also hit it with a good StarSan rinse before racking. I am leaning toward the racking cane and/or air exposure as the culprit here.

# Mitigation

There's not much room for error on the hot side. I sterilize all my equipment using the boiling wort (chiller, tubing, pump, whirlpool arm) for the last 15 minutes of boil. I wait until boil is re-attained before starting this timer.

I've been covering the wort during chilling recently, after it gets down to about 185F. I spray the shit out of the kettle lid and top with StarSan solution several times while the wort chills. Once the wort is chilled, I use one of the hoses it's been running through to drain into the fermenter. This is one potential point of infection. I have started using corny kegs as fermenters (I would link to it, but I haven't written a post on that yet...), so the opening which is exposed to air is not so large as a bucket (even with a lid). I'd still like to mitigate this, but I haven't seen any apparent problems stemming from this step - I have several good beers on tap at the moment.

I never touch my beers during fermentation. I am a geek, but I have trained myself to resist the urge to gather data about the state of the fermenting beer. I'd rather have an OK batch that I re-brew to try a different fermentation schedule than an infected batch because I was taking gravity readings every other hour.

This brings us to the culprits: secondary and racking. I never actually rack a beer to a secondary fermenter unless I am adding something to it (dry-hops, dry-herbs, wood, etc.). In this case, I had thought about dry-hopping my barleywine right before bottling (it *is* an American barleywine, after all); this is the reason I decided to bulk-age it rather than bottling four months ago.

## Sterilize the bitch

Once I started fermenting in my corny kegs, I loosely decided this was the way to go. My entire beer lifecycle is contained in stainless steel, and I can do closed-loop transfers. Experiencing this infection has solidified that resolve. I have already retired the bucket fermenter in question, as I suspected it contaminated my Belgian blond and the Dubbel I pitched onto the blond's yeast cake. I will also retire my racking cane and any non-keg fermenter. Yes, even my Better Bottle, though it has lasted about 2.5 years without issue.

I'll be adopting steam sterilization for my kegs. I can easily boil a quart of water in my electric kettle and seal it in a keg before transferring any wort or beer into it.

On the heat sanitation/sterilization note, I'll replace my closed-loop transfer hose with silicone. I have no reason to suspect the plastic is problematic, but I'd rather retire it before infection than after. Silicone can (typically) withstand 240F+, so I'll be able to drop this tubing into my [newly-acquired pressure canner][5] to sterilize.

## 99 Bottles of beer on the wall...

These practices should ensure my kegged beer is free from nasties that could ruin it, but what happens when I bottle for aging beers like my Belgians, this barleywine, or the Russian Imperial stout I have in mind? Enter, again, the pressure canner. I plan to take a [page out of Palmer's book][6]. I will wash, de-label, and dry my bottles (upside down, to prevent beasties from falling in). Once dried, I will fit them with a tight aluminum foil cap. When I have a full load for my canner, I'll process them at 15PSI for 20 minutes. These should store indefinitely, assuming the aluminum foil is tightly sealed.

I will dunk the bottle mouths in StarSan when bottling, too, or hit them with an open flame. I'll take any opportunity when running the canner to process my silicone tubing and metal bits (swivel connectors, beer gun parts, etc.) to be super safe. One day, I may splurge on [the $30/ea. stainless ball lock connectors][7]. For now, I think this should suffice. Oh, and I'll be numbering my kegs to not lose track of what ferments and conditions where...

I sincerely hope my long-winded, alcohol-enhanced post will assist someone besides me who is battling sanitation issues. I have brewed award-winning homebrew after that dreadful string of nine infected batches in a row, so there is no reason to be discouraged when encountering a bad batch. Mourn your beer, over-engineer a fix for your problems, and live to brew another day! Prost!

 [1]: http://bjcp.org/2008styles/catdex.php
 [2]: http://www.oracle.com/javaone
 [3]: http://www.bear-flavored.com/2012/12/off-flavor-or-infection-diagnosing-my.html
 [4]: http://homebrewingfun.blogspot.com/2012/11/yeast-project-ram-4.html
 [5]: http://www.amazon.com/Presto-01781-23-Quart-Pressure-Canner/dp/B0000BYCFU/ref=sr_1_1?ie=UTF8&qid=1378796092&sr=8-1&keywords=presto+23+quart+pressure+canner
 [6]: http://www.howtobrew.com/section1/chapter2-2-3.html
 [7]: http://www.beveragefactory.com/draftbeer/couplers/homebrew/hansen_ssmflball_gas.shtml?bstr=1

---
title: Twilio + Trello = Twellio
permalink: '/projects/twilio-trello-twellio'
---

Shortly before the end of 2011, the intrepid developers over at [FogCreek Software](http://www.fogcreek.com "FogCreek") released a new, free product called [Trello](http://www.trello.com 'Trello'). Trello is, at its core, a pretty simple idea: collaborative list management. The end result, however, is a great product that solves many issues from collaborative discussions to brainstorming to TODO lists.

Walking home one day early this month, I had a thought I wanted to capture in my Trello TODO board. Now, Trello works well enough in my smartphone's browser, but sometimes that is a bit heavy to use. "What if," I thought, "I could send a text message to Trello?!" And thus, [Twellio](http://twellio.labs.sigil.org 'Twellio') was born.

Out of sheer happenstance, I checked my Google Reader that night and saw the first [Twilio](http://www.twilio.com 'Twilio') developer contest of 2012: an app for DOers. I hacked Twellio together over the next couple weeks, and it's now functional. Combined with the Direct SMS widget found in Android Ice Cream Sandwich, capturing items on my Trello board is very quick.

I've been working on a side project written in [django](https://www.djangoproject.com/ 'django') for awhile now, so I naturally started this project in the same framework. I've been enjoying Python immensely, especially faced with the verbosity of Java on a daily basis.

A library for interacting with Twilio via Python [already exists](https://github.com/twilio/twilio-python 'twilio-python on GitHub'), but Trello was so new there was no such thing. When I started hacking on Twellio, there was no public API yet. I began [py-trello](https://github.com/sarumont/py-trello 'py-trello on GitHub') reverse-engineering the (mostly) RESTful URLs from using Trello. Shortly thereafter, work on the [Trello Public API](https://trello.com/board/trello-public-api/4ed7e27fe6abb2517a21383d 'Trello Public API') began. I've since switched py-trello to use the real API and plan on keeping it up to date as best I can. If you're interested in features, I've [created a Trello board](https://trello.com/board/py-trello/4f145d87b2f9f15d6d027b53) to track features, discussions, etc.

For now, Twellio is available for free. I may add features and create a paid version later on, but I don't want to build a second product simultaneously. If you have any comments, questions, suggestions, etc., please head over to [the Twellio board](https://trello.com/board/py-trello/4f145d87b2f9f15d6d027b53 'Twellio board on Trello') to discuss.

Cheers!

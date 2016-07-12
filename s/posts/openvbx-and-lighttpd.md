---
title: 'OpenVBX and Lighttpd'
date: '2012-04-25'
description:
categories: ['projects', 'technology']
tags: ['lighttpd', 'openvbx', 'twilio']
---
I run my web server on [Lighttpd](http://www.lighttpd.net) to keep things clean. Being the red-headed stepchild of the web server world, I've had some minor hurdles to overcome over the years (I'll contemplate switching if I hit a big one...). Wanting to take advantage of the awesomeness that is [Twilio](http://www.twilio.com) through [OpenVBX](http://www.openvbx.org), I found no one who had done this with lighttpd. All you have to do is enable `mod_redirect`: 

	server.modules = ( "mod_redirect", )

And configure a redirect thusly: 

	$HTTP["host"] =~ "openvbx.example.com" {
		url.rewrite = (
			"^/(.*)/index.php(.*)$" =&gt; "/$1/index.php?vbxsite=$2",
		)
	}

Voila!

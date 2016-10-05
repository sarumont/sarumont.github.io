---
title: Goodbye, Wordpress
---

I recently attempted to write a post about [my first time cooking with truffles][1]. I was able to 
upload two of the images to my [Wordpress][2] installation. After that, however, nothing would 
successfully upload.

Being a geek and, more importantly, a software developer, I dove into my server logs to try to find
the problem. I enabled debugging in Wordpress; I upped [Lighttpd's][3] logging verbosity. Neither 
of these yielded anything remotely close to an error.

Now, I've never been a big fan of Wordpress. It tends to work, and it allows people who would 
otherwise not have a website to create one (the merits of this are dubious). But it's relatively
magical, completely dynamic, and written in PHP. [Jeff Atwood][4] has explored [The PHP Singularity][5]
previously, so suffice to say that I have a visceral reaction to PHP. Compound this with the fact
that I have to fight Wordpress to be able to publish with tools that I like ([markdown][6] and 
[vim][7]), and it didn't take me long to start shopping for a new solution.

I have previously used [MovableType][8] as a blog platform. As far as I'm concerned, the differences
between MovableType and Wordpress are purely cosmetic, save one thing: MovableType publishes static
content. This can be done in Wordpress, but it is the default behaviour in MovableType. This
behavior makes a ton of sense for a typical website, as the content on most sites does not change
frequently. Even a frequently-updated news site could benefit from this method, as serving static 
HTML is less resource-intensive than generating said HTML for each request.

With the static page concept in mind, I was initially leaning toward rolling my own site (again).
It would be trivial to create a template and use server-side includes to make new posts simple. But
I (smartly) decided to see what else was out there before starting down this path. I came across
[Jekyll][9] and was intrigued. It had all the pieces I wanted: markdown was a first-class citizen,
published pages were static, the entire site can live in [git][13], and, as a bonus, it follows fairly 
well the UNIX philosophy by chaining several programs together to process various markup 
languages (markdown, LaTeX, etc.).

While setting up my site's skeleton in Jekyll, I had designs in my head for various scripts I would
need: new draft, publish draft, publish site. I was also going to have to roll the templates and CSS
by hand. I stumbled upon [JekyllBootstrap][10] and, finally, [ruhoh][11]. Ruhoh provides a more
refined framework than Jekyll, making it a snap to get started. I spent some time modifying the
Twitter Bootstrap-based theme to include a color palette of my liking and incorporate a very minimal
design, inspired by [zen habits][12].

I'm very happy with the new design and layout, and the barrier between me and a post is now
extremely low. I consciously left comments out of my design criteria. In my experience, comments
rarely add value worthy of their overhead (server resources, SPAM mitigation, trolling). I've
instead included social network links with each post to enable discussion on another medium,
increasing the bar enough to hopefully increase the quality.

Cheers!

 [1]: /2014/01/a-christmas-treat-truffled-beef-wellington
 [2]: http://www.wordpress.org
 [3]: http://www.lighttpd.net/
 [4]: http://twitter.com/codinghorror
 [5]: http://www.codinghorror.com/blog/2012/06/the-php-singularity.html
 [6]: http://daringfireball.net/projects/markdown/
 [7]: http://vim.org
 [8]: http://movabletype.org/
 [9]: http://jekyllrb.com/
 [10]: http://jekyllbootstrap.com/
 [11]: http://ruhoh.com/
 [12]: http://zenhabits.net
 [13]: http://git-scm.com

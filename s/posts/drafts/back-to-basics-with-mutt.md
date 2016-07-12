---
title: 'Back to Basics with mutt'
date: '2014-01-14'
description:
tags: []
---


	" When editing a file, always jump to the last cursor position
	:au BufReadPost *
				\ if &ft == 'gitcommit' || &ft == 'mail' |
				\   exe "normal! gg" |
				\   exe "startinsert" |
				\ elseif line("'\"") > 1 && line ("'\"") <= line("$") |
				\   exe "normal! g`\"" |
				\ endif


http://stevelosh.com/blog/2012/10/the-homely-mutt/
http://pbrisbin.com/posts/two_accounts_in_mutt/

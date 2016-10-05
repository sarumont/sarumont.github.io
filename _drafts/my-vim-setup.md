---
title: 'my vim setup'
date: '2014-03-20'
description:
tags: ['vim']
categories: ['it']
---

I am and have been a heavy vim user for the past decade or so. Addict would probably be a more
suitable descriptor. I use [vimium][4] and [vimperator][5], and I become very angry when I attempt to use vim keybindings in other applications only to have them delete all my work and pour out my beer.

Vim may have roots in the 80s (as do I), but it is by no means out of date. With the right
configuration and plugins, I feel vim can hold its own against any IDE for development.

# basics

I keep my `$HOME` in git; the details of this setup are out of the scope of this article, but they
will make an appearance on this blog in the future. One submodule in my home is [dotfiles][1]. This
in turn contains [vimfiles][2]. When setting up a new machine, I only need to create two symlinks
(`.vim` and `.vimrc`) in my home directory.

## pathogen.vim

[pathogen.vim][3] is the cornerstone of my vim configuration. **If you are not using pathogen, you are
doing it wrong.** If you really want to supercharge your vim life, I recommend you move your
`~/.vim` out of the way and start fresh with a pathogen-based approach.

http://dougblack.io/words/a-good-vimrc.html
http://mirnazim.org/writings/vim-plugins-i-use/
https://github.com/square/maximum-awesome
http://kien.github.io/ctrlp.vim/
http://www.lucianofiandesio.com/vim-configuration-for-happy-java-coding

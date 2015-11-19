---
title: 'Maven Project Organization'
date: '2015-10-12'
description:
categories: ['coding']
tags: ['devops', 'git', 'it', 'maven']
---

Back in April, I started a new gig at [Vertiscale][1]. When I came on board, we were a small team
with no real code. Everything that existed was either old cruft from the previous company or
proof-of-concept work to prove out some of the paths we wanted to take with the new product. As
such, one of my first tasks was to initialize our repositories and get the build systems configured.

We spent some time going through the architecture of the project and dividing everything up into
modules, building the dependency graph. We ended up with something like:

 - `utils`
 - `generator`
 - `core`
 - `server`
 - `ui`

The structure seemed clean, simple. We had room to grow with it. `core` and above was where business
logic lived, below were more re-usable utilities. We created a repository for each of these modules
to keep everything cleanly separated. In the end, we ended up with about 10 different repositories,
as we added different modules to add more functionality.

## Trouble in Paradise

As nice as it seemed, in theory, to have this clean separation of concerns, we quickly hit some
speed bumps. Multiple repositories means multiple things to pull, push, branch, and build. Everyone
had their own set of shell scripts to pull and build everything. Creating feature branches was a
huge pain in the ass when the feature spanned three or four repositories.

Having 10 different IntelliJ projects was terrible; while IntelliJ will allow you to add multiple maven projects into one IntelliJ project, it ends up being pretty gnarly. JRebel configuration was complex with multiple dependency JARs spanning different projects. 

Version management was...non-existent. I didn't want to even think about performing release
management across 10 repositories.

Needless to say, things had to change.

## Git to the rescue

As we began to ship our closed beta, the need for version management became ever more pressing. We
needed to know what customer had what code; we needed to enable automatic updates of certain
components, which required real versioning. We needed to begin using production development
practices (i.e. git-flow) to prevent destabilization.

So last Friday, I began the unification of our 10 repositories into three:

 - `master`
 - `vertiscale`
 - `ui`

`master` is simply a POM project to define external dependency versions, distribution management,
etc. for the others to inherit from. `vertiscale` is the flattened version of the other 8
repositories for a grand total of 49 maven modules. But we have 6 months of (arguably) valuable
commit history. :q





 [1]: http://www.vertiscale.com
 [2]: https://help.github.com/articles/about-git-subtree-merges/

---
title: 'Mark As Read with maildrop'
date: '2009-11-23'
description:
categories: ['technology']
tags: ['maildrop', 'mail']
permalink: '/uncategorized/mark_as_read_with_maildrop'
---
I run my own mail server using maildrop to deliver to multiple virtual LDAP users. My personal e-mail is sorted into many folders on the server as it comes in. To reduce my e-mail maintenance overhead, I decided to mark messages as read automatically in certain folders. This is useful for low-priority e-mails such as advertisements, coupons, etc.; I want to view these when I need them - not when I receive them.

It turns out that maildrop doesn't have any facilities built in to do this automatically. It does, however, provide you with the tools to roll your own:

    cc "${MAILDIR}.offers/"
    $(for x in ${MAILDIR}/.offers/new/*; do mv $x ${MAILDIR}/.offers/cur/${x##*/}:2,S; done)
    to "/dev/null"
    

Since the 'to' directive exits immediately after execution, you must cc then move. Delivering to /dev/null then stops execution of the filter.

**EDIT:** There were several comments on the original post. I have incorporated the results of the comments into the above script during the migration away from Wordpress

---
title: "Backups with ZFS and Amazon's S3"
date: '2010-03-15'
description:
categories: ['technology']
tags: ['zfs', 'freebsd', 'backups']
permalink: '/technology/backups_with_zfs_and_amazons_s3'
---
[Amazon's S3][1] provides unlimited, relatively cheap storage, accessible via HTTP (using REST/SOAP). This is ideal for personal offsite backups. The barrier to entry is low as are the costs.

[Sun's ZFS][2] turns everything you know about managing filesystems on its head. When I recently upgraded my storage array, I decided to load my machine with extra RAM for ZFS rather than buying a dedicated RAID card. One of the best features of ZFS is the low-cost snapshots. You can snapshot a filesystem, and said snapshot will not take any space on disk until the original is modified. To put it another way, the snapshots only store the (block-level) diffs.

The icing on the snapshot cake is the ability to send a snapshot as a stream. This can be piped over the network (i.e. ssh) or simply output to a file (then bzipped and uploaded to S3!). ZFS also allows you to send a differential of two snapshots.

To put this into action, I have written a script which will create a snapshot, bzip it, encrypt it and upload it to S3. I use a threshold to determine whether I should upload the full or incremental to save space/bandwidth (and time, as my cable upstream isn't that great...). To interface with S3, I'm using [s3tools][3].

I realized afterward that s3tools have GPG encryption built in, but I think it is simpler to use openssl and a passphrase for this use-case. Here's the script:

    #!/bin/sh
    #
    # Copyright 2010 Richard Kolkovich. All rights reserved.
    #
    # Redistribution and use in source and binary forms, with or without modification, are
    # permitted provided that the following conditions are met:
    #
    # 1. Redistributions of source code must retain the above copyright notice, this list of
    # conditions and the following disclaimer.
    #
    # 2. Redistributions in binary form must reproduce the above copyright notice, this list
    # of conditions and the following disclaimer in the documentation and/or other materials
    # provided with the distribution.
    #
    # THIS SOFTWARE IS PROVIDED BY Richard Kolkovich ``AS IS'' AND ANY EXPRESS OR IMPLIED
    # WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
    # FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Richard Kolkovich OR
    # CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
    # CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
    # SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
    # ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    # NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
    # ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    #
    # The views and conclusions contained in the software and documentation are those of the
    # authors and should not be interpreted as representing official policies, either expressed
    # or implied, of Richard Kolkovich.
    #
    ZFS=/sbin/zfs
    BZIP=/usr/bin/bzip2
    OPENSSL=/usr/bin/openssl
    MD5=/sbin/md5
    S3CMD=/opt/s3cmd/s3cmd
    BACKUP_DIR=/tank/backup
    TEMP=$BACKUP_DIR/tmp
    PASSFILE=$BACKUP_DIR/.password
    if ! test -d $TEMP; then
        mkdir $TEMP
    fi
    # Backup a given zfs store
    # arguments: name, zfs fs, threshold (0 to always use incremental), S3 bucket
    backup() {
        NAME=$1
        FS=$2
        THRESHOLD=$3
        BUCKET=$4
    
        # incremental
        SNAP=$FS@incremental
        SUFFIX=incremental
        $ZFS destroy $SNAP
        $ZFS snapshot $SNAP
        $ZFS send -i $FS@full $SNAP &gt; $TEMP/$NAME
        export BLOCKSIZE=1024
        SIZE=$(( `du $TEMP/$NAME | awk '{print $1}'` * 1024 ))
    
        if test $THRESHOLD -eq 0 || test $SIZE -gt $THRESHOLD; then
            rm $TEMP/$NAME
            $ZFS destroy $SNAP
            SNAP=$FS@full
            SUFFIX=full
            $ZFS destroy $SNAP
            $ZFS snapshot $SNAP
            $ZFS send $SNAP &gt; $TEMP/$NAME
    
            # a new full invalidates old incrementals
            $S3CMD del s3://$BUCKET/$NAME-incremental.bak
            $S3CMD del s3://$BUCKET/$NAME-incremental.bak.md5
        fi
    
        # compress
        $BZIP $TEMP/$NAME
        FILE=$TEMP/$NAME.bz2
    
        # encrypt snapshot
        $OPENSSL enc -aes-256-cbc -salt -pass file:$PASSFILE -in $FILE -out $FILE.bak
        rm $FILE
        FILE=$FILE.bak
        $MD5 $FILE &gt; $FILE.md5
    
        # send snapshot to S3
        $S3CMD put $FILE s3://$BUCKET/$NAME-$SUFFIX.bak
        $S3CMD put $FILE.md5 s3://$BUCKET/$NAME-$SUFFIX.bak.md5
    
        # clean up
        rm $FILE
        mv $FILE.md5 $BACKUP_DIR/$NAME.md5
    }
    

And I call backup() thusly: `backup "private" "tank/private" 52428800 "my.backup.bucket"`

 [1]: http://aws.amazon.com/s3/ "Amazon.com"
 [2]: http://en.wikipedia.org/wiki/ZFS "ZFS"
 [3]: http://s3tools.org/s3cmd

#!/usr/bin/env zsh

TASKDIR=$HOME/.task
FILENAME=task-backup-$(date +'%Y%m%d').tar.gz
DESTINATION=$HOME/Documents/backups/taskwarrior

cd $TASKDIR
tar czf $FILENAME *
mv $FILENAME $DESTINATION/$FILENAME


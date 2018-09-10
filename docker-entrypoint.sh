#!/bin/sh
	set -e
	#Check if the FANCY_FOLDER is mounted
	! grep -q $FANCY_FOLDER /proc/mounts 2> /dev/null > /dev/null && echo "You don't bind a volume to $FANCY_FOLDER" && exit 1
	touchName=touch.$RANDOM
	#Verify if the mounted volume has write perms
	touch /fancy/mount/$touchName 2> /dev/null >/dev/null && echo "The mounted folder has write perms, please only mount in read only with the option :ro at the last of the volume statement" && rm -f /fancy/mount/$touchName && exit 1
	exec $@

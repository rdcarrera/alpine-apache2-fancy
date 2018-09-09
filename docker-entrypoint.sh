#!/bin/sh
	set -e
	! grep -q $FANCY_FOLDER /proc/mounts 2> /dev/null > /dev/null && echo "You don't bind a volume to $FANCY_FOLDER" && exit 1
	touchName=touch.$RANDOM
	touch /fancy/mount/$touchName 2> /dev/null >/dev/null && echo "The mounted folder has write perms, please only mount in read only with the option :ro at the last of the volume statement" && rm -f /fancy/mount/$touchName && exit 1
	[ ! -d /run/apache2 ] && mkdir /run/apache2
	if [ ! -L /var/www/localhost/htdocs ];then
		rm -rf /var/www/localhost/htdocs
		ln -s $FANCY_FOLDER /var/www/localhost/htdocs
	fi
	exec $@

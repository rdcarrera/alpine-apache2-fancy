#!/bin/sh
	set -e
	#Check if the FANCY_FOLDER is mounted
	! grep -q $FANCY_FOLDER /proc/mounts 2> /dev/null > /dev/null && echo "You don't bind a volume to $FANCY_FOLDER" && exit 1
	touchName=touch.$RANDOM
	#Verify if the mounted volume has write perms
	touch /fancy/mount/$touchName 2> /dev/null >/dev/null && echo "The mounted folder has write perms, please only mount in read only with the option :ro at the last of the volume statement" && rm -f /fancy/mount/$touchName && exit 1
	if [ "${FANCY_FOOT_ENABLE}" == "no" ];then
		sed -i "/footer/d" ${DOCKER_WORKDIR}/html/footer.html
	else
		sed -i "s|FANCY_FOOT_URL|${FANCY_FOOT_URL}|" ${DOCKER_WORKDIR}/html/footer.html
		sed -i "s/FANCY_FOOT_MESG/\"${FANCY_FOOT_MESG}\"/" ${DOCKER_WORKDIR}/html/footer.html
	fi
	exec $@

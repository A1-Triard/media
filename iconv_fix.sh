#!/bin/sh

case "$1" in
start)
	echo -n ' iconv warning up'
	dev=$(/usr/bin/mktemp /tmp/iconv_fix.XXXXXX)
	/bin/dd if=/dev/zero of=$dev bs=18432 count=1 2>/dev/null
	/sbin/mdconfig -a -t vnode -f $dev -u 31
	/sbin/newfs_msdos -F 12 /dev/md31 >/dev/null 2>&1
	point=$(/usr/bin/mktemp -d /tmp/icon_fix_d.XXXXXX)
	/sbin/mount_msdosfs -L ru_RU.UTF-8 -D CP866 /dev/md31 $point
	/sbin/umount /dev/md31
	/bin/rmdir $point
	/sbin/mdconfig -d -u 31
	/bin/rm -f $dev	;;
stop)
	echo -n ' iconv warning up'
	;;
*)
	echo "Usage: `basename $0` {start|stop}" >&2
	exit 64
	;;
esac

exit 0

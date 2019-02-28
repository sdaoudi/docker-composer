#!/bin/sh

uid=$(stat -c %u /var/www)
gid=$(stat -c %g /var/www)

sed -i -r "s/www-data:x:\d+:\d+:/www-data:x:$uid:$gid:/g" /etc/passwd
sed -i -r "s/www-data:x:\d+:/www-data:x:$gid:/g" /etc/group
chown $uid:$gid /var/www

user=$(grep ":x:$uid:" /etc/passwd | cut -d: -f1)
if [ $# -eq 0 ]; then
    composer
else
    exec su-exec $user "$@"
fi

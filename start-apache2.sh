#!/bin/sh

echo "Copy default files to mounted volume"
if [ ! -f /etc/apache2/apache2.conf ]; then
   cp -af /opt/defaults/etc/apache2/* /etc/apache2/
fi

/usr/sbin/apache2ctl -D FOREGROUND

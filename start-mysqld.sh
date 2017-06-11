#!/bin/bash

if [[ ! -d /var/lib/mysql/asterisk ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected"
    echo "=> Installing MySQL ..."
    test -d /opt/defaults/data/mysql && cp -af /opt/defaults/data/mysql/* /var/lib/mysql/
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"
    newdb=true
fi


mysqld_safe

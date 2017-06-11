#!/bin/bash


if [[ ! -d /var/lib/mysql/asterisk ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected"
    echo "=> Installing MySQL ..."
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"
fi


mysqld_safe

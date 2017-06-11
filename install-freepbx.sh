#!/bin/bash

pushd /usr/src/freepbx

# start apache+mysql+asterisk
/sbin/my_init &

sleep 5

mysqladmin -u root create asterisk
mysqladmin -u root create asteriskcdrdb
mysql -u root -e "GRANT ALL PRIVILEGES ON asterisk.* TO asterisk@localhost IDENTIFIED BY '$ASTERISK_DB_PW';"
mysql -u root -e "GRANT ALL PRIVILEGES ON asteriskcdrdb.* TO asterisk@localhost IDENTIFIED BY '$ASTERISK_DB_PW';"
mysql -u root -e "flush privileges;"

./install -f -n  \
&& fwconsole ma refreshsignatures  \
&& fwconsole moduleadmin downloadinstall backup  \
 ivr  \
 donotdisturb  \
 findmefollow  \
 announcement  \
&& fwconsole restart --immediate  




popd
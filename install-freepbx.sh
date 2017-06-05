#!/bin/bash

pushd /usr/src/freepbx

# start apache+mysql+asterisk
/sbin/my_init &

sleep 3

./install -f -n  \
&& fwconsole ma refreshsignatures  \
&& fwconsole moduleadmin downloadinstall backup  \
&& fwconsole moduleadmin downloadinstall ivr  \
&& fwconsole moduleadmin downloadinstall donotdisturb  \
&& fwconsole moduleadmin downloadinstall findmefollow  \
&& fwconsole restart --immediate  


killall my_init


popd
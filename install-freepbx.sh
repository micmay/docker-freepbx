#!/bin/bash

test -f /etc/freepbx.conf && exit 0

pushd /usr/src
curl -sf -o freepbx.tgz -L http://mirror.freepbx.org/modules/packages/freepbx/freepbx-13.0-latest.tgz \
&& tar xfz freepbx.tgz \
&& rm freepbx.tgz \
&& cd /usr/src/freepbx \
&& mkdir /var/www/html \
&& echo "<pre>" > /var/www/index.html \
&& ./install -f -n \
&& fwconsole ma refreshsignatures \
&& rm -r /usr/src/freepbx \
&& fwconsole moduleadmin downloadinstall backup \
&& echo "Forbidden ..." > /var/www/index.html

fwconsole restart --immediate 
popd
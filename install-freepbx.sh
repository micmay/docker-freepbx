#!/bin/bash

test -f /etc/freepbx.conf && exit 0

pushd /usr/src
curl -sf -o freepbx.tgz -L http://mirror.freepbx.org/modules/packages/freepbx/freepbx-13.0-latest.tgz \
&& tar xfz freepbx.tgz \
&& rm freepbx.tgz \
&& cd /usr/src/freepbx \
&& service mysql start \
&& mkdir /var/www/html \
&& /etc/init.d/apache2 start \
&& /etc/init.d/asterisk start \
&& sleep 5 \
&& echo "<pre>" > /var/www/index.html \
&& ./install -f -n >>  /var/www/index.html 2>&1 \
&& fwconsole ma refreshsignatures \
&& fwconsole restart \
&& rm -r /usr/src/freepbx \
&& echo "Redirect /index.html /html/" > /var/www/.htaccess \
&& echo "Successfull ..." > /var/www/index.html
popd
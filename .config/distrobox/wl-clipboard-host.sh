#!/bin/sh

echo "success" > /success.txt
#mkdir -p /usr/sbin
#mkdir -p /usr/local/bin
#ln -s /usr/sbin/distrobox-host-exec /usr/local/bin/wl-copy
#ln -s /usr/sbin/distrobox-host-exec /usr/local/bin/wl-paste

ln -s `type -P distrobox-host-exec` /usr/local/bin/wl-copy
ln -s `type -P distrobox-host-exec` /usr/local/bin/wl-paste

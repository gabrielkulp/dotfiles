#!/bin/sh

mkdir -p /usr/local/bin
ln -s "$(type -P distrobox-host-exec)" /usr/local/bin/wl-copy
ln -s "$(type -P distrobox-host-exec)" /usr/local/bin/wl-paste

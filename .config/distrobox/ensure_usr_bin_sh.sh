#!/bin/sh

# At least Alpine doesn't have /usr/bin/sh, so distrobox-host-exec fails
# since its shebang assumes the interpreter location. Lightweight fix:
if [ ! -x /usr/bin/sh ]; then
	# If /bin/sh is a file, point to it.
	# If it's a symlink, resolve and point to the same target.
	ln -sf "$(readlink -f /bin/sh)" /usr/bin/sh
fi

#!/bin/sh

##
# Start X
##

[ -f ~/.profile ] && . ~/.profile

[ -d /usr/local/share/fonts/gohufont/ ] &&
	xset +fp /usr/local/share/fonts/gohufont/

# key ring without display manager
[ -f /etc/X11/xinit/xinitrc.d/50-systemd-user.sh ] &&
	. /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

[ -x /usr/bin/gnome-keyring-daemon ] &&
	eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)" &&
	export SSH_AUTH_SOCK

[ -x "$(command -v dwm-start)" ] &&
exec dwm-start

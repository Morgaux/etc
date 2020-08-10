#!/bin/sh

_SYSTEMD_SCRIPT="/etc/X11/xinit/xinitrc.d/50-systemd-user.sh"
_KEYRING_DAEMON="/usr/bin/gnome-keyring-daemon"

if [ -f "$_SYSTEMD_SCRIPT" ]
then
	# Skip shell checking the systemd script, it'll probably be rubbish
	# shellcheck source=/dev/null
	. "$_SYSTEMD_SCRIPT"
fi

if [ -x "$_KEYRING_DAEMON" ]
then
	eval "$("$_KEYRING_DAEMON" --start --components=pkcs11,secrets,ssh)" &&
	export SSH_AUTH_SOCK
fi


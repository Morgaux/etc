#!/bin/sh

for FONT in /usr/local/share/fonts/gohufont/ \
            /usr/local/share/fonts/ibm-plex/ \
            /usr/local/share/fonts/X11/misc/
do
	if [ -d "$FONT" ]
	then
		xset +fp "$FONT"
	fi
done

# update cache in the background
if [ -x "$(command -v fc-cache)" ]
then
	(fc-cache -f -v >> "$HOME/.xsession-errors" >/dev/null 2>&1 &) &
fi


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


# search for available WMs in order of preference
for DESK in sude-start dwm fvwm startxfce4 budgie-desktop gnome-session
do
	if [ -x "$(command -v "DESK")" ]
	then
		break
	fi
done

# always prefer fvwm on OBSD
if [ "$(uname)" = "OpenBSD" ]
then
	DESK="fvwm"
fi

exec "$DESK"


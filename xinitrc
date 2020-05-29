#!/bin/sh

#
# Start X config
#

# Source external scripts {{{
if [ -f ~/.profile ]
then
	. ~/.profile
fi
# Source external scripts }}}

# Setup fonts for Xorg {{{
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
(fc-cache -f -v > "$HOME/.xsession-errors" >/dev/null 2>&1 &) &
# Setup fonts for Xorg }}}

# Setup key ring without display manager {{{
if [ -f /etc/X11/xinit/xinitrc.d/50-systemd-user.sh ]
then
	. /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
fi

if [ -x /usr/bin/gnome-keyring-daemon ]
then
	eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)" &&
	export SSH_AUTH_SOCK
fi
# Setup key ring without display manager }}}

# Select WM / DE {{{
# search for available WMs in order of preference
for DESK in sude-start dwm fvwm startxfce4 budgie-desktop gnome-session
do
	if [ -x "$(command -v "DESK")" ]
	then
		break
	fi
done

if [ "$(uname)" = "OpenBSD" ]
then
	DESK="fvwm" # always prefer fvwm on OBSD
fi
# Select WM / DE }}}

exec "$DESK"


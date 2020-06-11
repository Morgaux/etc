#!/bin/sh

#
# Start X config
#

# Source external scripts {{{
[ -f ~/.profile ] && . ~/.profile
# Source external scripts }}}

# Setup fonts for Xorg {{{
for FONT in \
	/usr/local/share/fonts/gohufont/ \
	/usr/local/share/fonts/ibm-plex/ \
	/usr/local/share/fonts/X11/misc/
do
	[ -d "$FONT" ] && xset +fp "$FONT"
done
(fc-cache -f -v > "$HOME/.xsession-errors" >/dev/null 2>&1 &) &
# Setup fonts for Xorg }}}

# Setup key ring without display manager {{{
[ -f /etc/X11/xinit/xinitrc.d/50-systemd-user.sh ] &&
	. /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

[ -x /usr/bin/gnome-keyring-daemon ] &&
	eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)" &&
	export SSH_AUTH_SOCK
# Setup key ring without display manager }}}

# Search for fallbacks if SUDE not available {{{
[ -x "$(command -v sude-start)" ] || # SUDE not installed, try fallbacks in order
	for WM in dwm fvwm startxfce4 budgie-desktop gnome-session
	do
		[ -x "$(command -v "$WM")" ] && exec "$WM"
	done
# Search for fallbacks if SUDE not available }}}

exec sude-start

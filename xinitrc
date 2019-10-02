#!/bin/sh

##
# Start X
##

[ -f ~/.profile ] && . ~/.profile

# fonts
for FONT in \
	/usr/local/share/fonts/gohufont/ \
	/usr/local/share/fonts/X11/misc/
do
	[ -d "$FONT" ] && xset +fp "$FONT"
done
(fc-cache -f -v > "$HOME/.xsession-errors" 2>/&1 &) &

# key ring without display manager
[ -f /etc/X11/xinit/xinitrc.d/50-systemd-user.sh ] &&
	. /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

[ -x /usr/bin/gnome-keyring-daemon ] &&
	eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)" &&
	export SSH_AUTH_SOCK

[ -x "$(command -v sude-start)" ] || # SUDE not installed, try fallbacks in order
	for WM in dwm fvwm startxfce4 budgie-desktop gnome-session
	do
		[ -x "$(command -v "$WM")" ] && exec "$WM"
	done

exec sude-start

#!/bin/sh

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


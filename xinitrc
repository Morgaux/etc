#!/bin/sh
# shellcheck disable=SC1090
# shellcheck disable=SC1091

#
# Start X config
#

# Source external scripts {{{
if [ -f ~/.profile ]
then
	. ~/.profile
fi
# Source external scripts }}}

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


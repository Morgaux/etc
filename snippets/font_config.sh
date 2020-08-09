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


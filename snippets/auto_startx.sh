#!/bin/sh

# Check that display and Xorg are all valid and setup
if [ -z "$DISPLAY"             ] &&
   [ -n "$XDG_VTNR"            ] &&
   [ "$XDG_VTNR" -eq 1         ] &&
   [ "$TERM" = "linux"         ] &&
   [ -x "$(command -v startx)" ]
then
	# Configure timeout below
	START="$(date +%s)"
	END="$START"
	_DELTA_T="1"
	_TIMEOUT="5"

	# Show ufetch if found
	if [ -x ~/bin/uf ]
	then
		~/bin/uf
		echo "" # leave blank line
	fi

	# Show fortune is available
	if [ -x "$(command -v fortune)" ]
	then
		fortune -as
		echo "" # leave blank line
	fi

	# Show interruptible countdown to allow ^C to break to TTY
	echo "Starting X in..."
	while true
	do
		END="$(date +%s)"
		_DELTA_T="$((END - START))"
		if [ "$_DELTA_T" -lt "$_TIMEOUT" ]
		then
			echo "$((_TIMEOUT - _DELTA_T))"
			sleep 1
		else
			break
		fi
	done

	# Call startx
	startx
fi


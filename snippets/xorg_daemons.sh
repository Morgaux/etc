#!/bin/sh

# $1  = command to run in background
# $2+ = arguments to be passed to the invocation of $1
run_one_instance_in_bg() {
	# This function encapsulates the rather finicky behaviour of getting a
	# command to be run in the background __exactly__ once. There are many
	# verbose and messy ways of implementing daemons in shellscript, and
	# I've previously tried most of them for various projects. As is usually
	# the case, the simpler the better, so here the first argument is taken
	# as a command name and the remaining arguments as the arguments to pass
	# to the command. If the command is available, it is called with it's
	# arguments in a sub shell in the background.

	# Ignore the fact that this greps ps(1), this is necessary and I know
	# what I'm doing.
	# shellcheck disable=SC2009
	if [ -x "$(command -v "$1")" ] # check that $1 is an available command
	then
		# Ignore missing double quotes around $@, in this case we want
		# the separate elements of $@ to be received as separate
		# arguments to sh(1).
		# shellcheck disable=2068
		ps cax | grep -iq "$1" || ( sh -c $@ &) # background the command
	fi # hide error stream for the daemon invoke
}

# Run these daemons if running Xorg
if [ -n "$DISPLAY" ] && xset q >/dev/null 2>&1
then
	run_one_instance_in_bg "xbanish"
	run_one_instance_in_bg "redshift"
	run_one_instance_in_bg "xrdb" "$HOME/.Xresources"
fi


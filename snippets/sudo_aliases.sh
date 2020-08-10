#!/bin/sh

for i in           \
	apk        \
	apt        \
	apt-get    \
	pacman     \
	portmaster \
	yum        \
	dnf        \
	brew       \
	eopkg      \
	wifi-menu
do
	# Don't bother making an alias if the command doesn't exist
	if [ ! -x "$(command -v "$i")" ]
	then
		continue
	fi

	# Add '-y' flag to these commands (just to save typing)
	if [ "$i" = "apt" ] || [ "$i" = "apt-get" ]
	then
		i="${i} -y"
	fi

	# Alias the command to 'sudo' of itself, not that the assignment here is
	# perfectly valid, but.... shellcheck sees the "${FOO}=${FOO}" and tries
	# to be a good Samaritan and point out that this doesn't actually change
	# the value of FOO, which isn't what we're trying to do here but thanks
	# for you're concern. :)
	# shellcheck disable=SC2139
	alias "${i}=sudo ${i}"
done


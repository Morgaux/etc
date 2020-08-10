#!/bin/sh

for i in pkg pkg_add pkg_delete
do
	# Command doesn't exist, don't bother
	if [ ! -x "$(command -v "$i")" ]
	then
		continue
	fi

	# Alias the command to 'doas' of itself, not that the assignment here is
	# perfectly valid, but.... shellcheck sees the "${FOO}=${FOO}" and tries
	# to be a good Samaritan and point out that this doesn't actually change
	# the value of FOO, which isn't what we're trying to do here but thanks
	# for you're concern. :)
	# shellcheck disable=SC2139
	alias "${i}=doas ${i}"
done


#!/bin/sh

#
# This section moves everything in the home directory to ~/var, except for
# dotfiles and the directories I allow, listed below.
#
[ -x "$(command -v basename)" ] && for DIR in ~/*
do
	[ -d "$DIR" ] || continue # ignore non dirs, i.e. files

	DIR="$(basename "$DIR")" # strip path

	case "$DIR" in
		"."*)
			# ignore dot.dirs, do nothing
			true
			;;
		""|"bin"|"etc"|"iso"|"lib"|"new"|"old"|"src"|"tmp"|"uni"|"var")
			# I don't mind this dir being in HOME
			true
			;;
		*)
			# this dir doesn't belong here
			if [ -d "${HOME}/var/${DIR}" ]
			then
				mv -f "${HOME}/${DIR}"/*  "${HOME}/var/${DIR}"/.
				mv -f "${HOME}/${DIR}"/.* "${HOME}/var/${DIR}"/.
				rm -rf "${HOME:?}/${DIR}"
			else
				mv -f "${HOME}/${DIR}"  "${HOME}/var"/.
			fi >/dev/null 2>&1
			;;
	esac
done


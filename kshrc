#!/bin/ksh

try_source() { # include external scripts
	[ -f "$1" ] && . "$1" ;
}

case "$CURRENT_SHELL" in
	*ksh*)
		[[ $- = *i* ]] || return
		try_source /etc/ksh.kshrc # source global ksh settings
		;;
	*)
		# Source aliases for non-ksh shells, then exit
		return
		;;
esac


#!/bin/ksh

_PS1DIR() { # safely get the base directory for the PS1 prompt
	case "$PWD" in
		"$HOME") echo "~" ;;
		"/")     echo "/" ;;
		*)       echo "${PWD##*/}" ;;
	esac
}

PS1="\$(_PS1DIR) \$ "

export PS1


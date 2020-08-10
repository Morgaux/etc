#!/bin/ksh

cd() { # change directories but allow short hand directory names
	if [ "$#" -eq 0 ] ; then
		builtin cd "${HOME}" || return 1
	else
		builtin cd    "$*"/  2> /dev/null ||
		builtin cd    "$*"*/ 2> /dev/null ||
		builtin cd ./*"$*"*/ 2> /dev/null ||
		echo "cd: $* not found" 1>&2
	fi
}


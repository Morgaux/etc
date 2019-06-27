#!/bin/ksh

#
# http://gitlab.com/morgaux/etc
#

##
# mksh and ksh configuration
##

CURRENT_SHELL="$(ps -p $$ | tail -1 | awk '{print $4}' || basename "$SHELL")"

# Source aliases for non-ksh shells
[ -f ~/etc/aliases ] && . ~/etc/aliases

# don't run unless interactive ksh seession
case "$CURRENT_SHELL" in
	*ksh*)
		[[ $- = *i* ]] || return ;;
	*)
		return ;;
esac

##
# Functions
##

# change dir
cd() {
	if [ "$#" -eq 0 ] ; then
		builtin cd "${HOME}"
	else
		builtin cd "$*" 2> /dev/null     ||
		builtin cd "$*"* 2> /dev/null    ||
		builtin cd ./*"$*"* 2> /dev/null ||
		echo "cd: $* not found" 1>&2
	fi
}

# safe base dir name
_PS1DIR() {
	case "$PWD" in
		"$HOME")	PS1DIR="~" ;;
		"/")		PS1DIR="/" ;;
		*)		PS1DIR="${PWD##*/}" ;;
	esac
	echo "$PS1DIR"
}

##
# set ksh prompt
##
PS1="\$(_PS1DIR) \$ "

##
# History
##
HISTFILE="$HOME/var/${CURRENT_SHELL}_history"
HISTSIZE=1024

##
# environment
##

for SCRIPT in profile startup git-config welcome
do
	[ -f "$HOME/etc/$SCRIPT" ] && $HOME/etc/$SCRIPT
done


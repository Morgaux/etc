#!/bin/ksh

#
# http://gitlab.com/morgaux/etc
#

clear

##
# mksh and ksh configuration
##

~/bin/log "Running kshrc..."

#[ -x "$(command -v dvtm)" ] && [ -z "$DVTM" ] && log "Starting dvtm" && exec dvtm

##
# Functions
##

# change dir
cd() {
	if [ "$#" -eq 0 ] ; then
		builtin cd "${HOME}"
	else
		builtin cd "$*" 2> /dev/null ||
		builtin cd "$*"* 2> /dev/null ||
		builtin cd ./*"$*"* 2> /dev/null ||
		echo "cd: $* not found" 1>&2
	fi
}

# safe base dir name
_PS1DIR() {
	case "$PWD" in
		"$HOME")	PS1DIR="~";;
		"/")		PS1DIR="/";;
		*)		PS1DIR="${PWD##*/}";;
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
HISTFILE="$HOME/var/ksh_history" # note: mksh and (o/pd)ksh have in compatible formats
HISTSIZE=1024

##
# environment
##
[ -f ~/etc/profile ] && ~/etc/profile # run script to update ~/.profile
#[ -z "$EDITOR" ] || . ~/.profile # profile may not have been read if EDITOR unset
[ -f ~/etc/startup ] && . ~/etc/startup # start applications
[ -f ~/etc/aliases ] && . ~/etc/aliases # aliases
[ -f ~/etc/welcome ] && . ~/etc/welcome # welcome messages

~/bin/log "kshrc completed, happy hacking!"


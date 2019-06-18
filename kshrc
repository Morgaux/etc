#!/bin/ksh

#
# http://gitlab.com/morgaux/etc
#

##
# mksh and ksh configuration
##

~/bin/log "Running kshrc..." || true

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
HISTFILE="$HOME/var/ksh_history" # note: mksh and (o/pd)ksh are incompatible
HISTSIZE=1024

##
# environment
##
[ -f ~/etc/profile ] &&   ~/etc/profile		# run script to update ~/.profile
[ -f ~/etc/startup ] && . ~/etc/startup		# start applications
[ -f ~/etc/aliases ] && . ~/etc/aliases		# aliases
[ -f ~/etc/welcome ] && . ~/etc/welcome		# welcome messages
[ -f ~/etc/git-config ] && . ~/etc/git-config	# configure git

~/bin/log "kshrc completed, happy hacking!" || true


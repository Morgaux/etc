#!/bin/ksh
# shellcheck source=/dev/null

#
# http://gitlab.com/morgaux/etc
#

##
# mksh and ksh configuration
##

try_source() { [ -f "$1" ] && . "$1" ; }

CURRENT_SHELL="$(ps -p "$$" | tr ' ' '\n' | tail -n 1 || basename "$SHELL")"

# Source aliases for non-ksh shells
try_source ~/etc/aliases

# don't run unless interactive ksh session
case "$CURRENT_SHELL" in
	*ksh*)
		[[ $- = *i* ]] || return ;;
	*)
		return ;;
esac

try_source /etc/ksh.kshrc

# Curse emacs!
# ...but I like to use the up arrow for my shell history
set -o emacs
alias _A=
alias _B=
alias _C=
alias _D=
alias _H=
alias _Y=
alias __A=
alias __B=
alias __C=
alias __D=
alias __H=
alias __Y=

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
HISTFILE="$HOME/var/history.${CURRENT_SHELL}"
HISTSIZE=1024

##
# environment
##

for SCRIPT in profile startup git-config directory
do
	[ -f "$HOME/etc/$SCRIPT" ] && ( "$HOME/etc/$SCRIPT" & )
done

[ -f "$HOME/etc/welcome" ] && "$HOME/etc/welcome"


#!/bin/ksh
# shellcheck source=/dev/null

#
# http://gitlab.com/morgaux/etc
#

##
# mksh and ksh configuration
##

try_source() { [ -f "$1" ] && . "$1" ; }

CURRENT_SHELL="$(ps | grep "$$" | awk '!/grep/{print $4;exit 0}')"

# don't run unless interactive ksh session
case "$CURRENT_SHELL" in
	*ksh*)
		[[ $- = *i* ]] || return
		try_source /etc/ksh.kshrc # source global ksh settings
		try_source ~/etc/aliases  # override global aliases
		;;
	*)
		# Source aliases for non-ksh shells, then exit
		try_source ~/etc/aliases
		return
		;;
esac


# Curse emacs!
# ...but I like to use the up arrow for my shell history
set -o emacs
alias  _A=
alias  _B=
alias  _C=
alias  _D=
alias  _H=
alias  _Y=
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
		builtin cd    "$*"/  2> /dev/null ||
		builtin cd    "$*"*/ 2> /dev/null ||
		builtin cd ./*"$*"*/ 2> /dev/null ||
		echo "cd: $* not found" 1>&2
	fi
}

# safe base dir name
_PS1DIR() {
	case "$PWD" in
		"$HOME") echo "~" ;;
		"/")     echo "/" ;;
		*)       echo "${PWD##*/}" ;;
	esac
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

for SCRIPT in profile startup git-config vim-plugins directory
do
	[ -f "$HOME/etc/$SCRIPT" ] && ( "$HOME/etc/$SCRIPT" & )
done

[ -f "$HOME/etc/welcome" ] && "$HOME/etc/welcome"


#!/bin/ksh
# shellcheck source=/dev/null

# ~/etc/kshrc {{{

#
# mksh and ksh configuration
#

# Functions {{{
try_source() { # include external scripts
	[ -f "$1" ] && . "$1" ;
}

cd() { # change directories but allow short hand directory names
	if [ "$#" -eq 0 ] ; then
		builtin cd "${HOME}"
	else
		builtin cd    "$*"/  2> /dev/null ||
		builtin cd    "$*"*/ 2> /dev/null ||
		builtin cd ./*"$*"*/ 2> /dev/null ||
		echo "cd: $* not found" 1>&2
	fi
}

_PS1DIR() { # safely get the base directory for the PS1 prompt
	case "$PWD" in
		"$HOME") echo "~" ;;
		"/")     echo "/" ;;
		*)       echo "${PWD##*/}" ;;
	esac
}
# Functions }}}

# Detect the type of shell running, only run for interactive *ksh sessions {{{
CURRENT_SHELL="$(ps | awk "/$$/{print \$NF; exit 0}")"

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
# Detect the type of shell running, only run for interactive *ksh sessions }}}

# Setup Emacs like cursor key navigation {{{

#
# I hate Emacs but I realllllly like using the up arrow 17 times to find an "ls"
# commands in my shell history to save 2 key presses.
#

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
# Setup Emacs like cursor key navigation }}}

# Miscellaneous configurations {{{

#
# Prompt
#
PS1="\$(_PS1DIR) \$ "

#
# History
HISTFILE="$HOME/var/history.$(echo "${CURRENT_SHELL}" | sed 's/[^a-zA-Z0-9]//g')"
HISTSIZE=1024

#
# Environment
#
for SCRIPT in profile startup git-config vim-plugins directory
do
	[ -f "$HOME/etc/$SCRIPT" ] && ( "$HOME/etc/$SCRIPT" & )
done

#
# welcome script
#
[ -f "$HOME/etc/welcome" ] && "$HOME/etc/welcome"
# Miscellaneous configurations {{{

# ~/etc/kshrc }}}


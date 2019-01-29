#!/bin/ksh
#
# https://gitlab.com/morgaux/etc
#

# Aliases
alias a="alias"

a _cd="builtin cd"
a c="clear"
a ls="ls -F"
a la="ls -A"
a ll="ls -l"
a mkdir="mkdir -p"
a x="exit"
a ..="cd .."

# CMDs with "c" prefix
for i in e ls la ll; do
	a c"$i"="c; $i"
done

# Functions
err()
{
	echo "$@" 1>&2
}

cd()
{
	if [ "$#" -eq 0 ] ; then
		_cd ${HOME}
	else
		_cd "$@" 2> /dev/null ||
		_cd "$@"* 2> /dev/null ||
		_cd *"$@"* 2> /dev/null ||
		err "cd: $@ not found"
	fi
}

# Environment
_PS1DIR()
{
	case "$PWD" in
		"$HOME")
			PS1DIR="~"
			;;
		"/")
			PS1DIR="/"
			;;
		*)
			PS1DIR="${PWD##*/}"
			;;
	esac
	echo $PS1DIR
}

PS1="\$(_PS1DIR) \$ "

# History
# note: mksh and (o/pd)ksh have in compatible formats
if [ -d "$HOME/var" ] ; then
	HISTFILE="$HOME/var/ksh_history"
else
	HISTFILE="$HOME/.ksh_history"
fi
HISTSIZE=1024

uname -sm
[ -x "$(command -v fortune)" ] && fortune


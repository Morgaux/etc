#!/bin/ksh

#
# http://gitlab.com/morgaux/etc
#

# mksh and ksh configuration

# if tmux exists and is not runing
[ -x "$(command -v tmux)" ] && [ -z "$TMUX" ] && exec tmux

# Functions

# change dir
cd()
{
if [ "$#" -eq 0 ] ; then
	builtin cd "${HOME}"
else
	builtin cd "$@" 2> /dev/null ||
	builtin cd "$@"* 2> /dev/null ||
	builtin cd ./*"$@"* 2> /dev/null ||
	echo "cd: $@ not found" 1>&2
fi
}

# safe base dir name
_PS1DIR()
{
case "$PWD" in
	"$HOME")	PS1DIR="~";;
	"/")		PS1DIR="/";;
	*)		PS1DIR="${PWD##*/}";;
esac
echo "$PS1DIR"
}

# ksh prompt
PS1="\$(_PS1DIR) \$ "

# note: mksh and (o/pd)ksh have in compatible formats
HISTFILE="$HOME/var/ksh_history"
HISTSIZE=1024

# update .profile
[ -f ~/etc/profile ] && ~/etc/profile
[ -z "$EDITOR" ] || . ~/.profile

[ -f ~/etc/startup ] && . ~/etc/startup
[ -f ~/etc/welcome ] && . ~/etc/welcome


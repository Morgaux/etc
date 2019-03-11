#!/bin/ksh

# aliases
[ -f ~/etc/aliases ] && . ~/etc/aliases

# change dir
cd()
{
if [ "$#" -eq 0 ] ; then
	_cd "${HOME}"
else
	_cd "$@" 2> /dev/null ||
	_cd "$@"* 2> /dev/null ||
	_cd ./*"$@"* 2> /dev/null ||
	echo "cd: $@ not found" 1>&2
fi
}

# which shell am I running
runshell()
{
ps $$ | tail -n 1 | sed 's/.*://g' | cut -c 4-
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

# update .profile
[ -f ~/.profile ] || . ~/etc/profile
[ -f ~/etc/profile ] && cat ~/etc/profile > ~/.profile

# make my dirs
[ -d ~/src ] || mkdir -p ~/src
[ -d ~/var ] || mkdir -p ~/var
[ -d ~/tmp ] || mkdir -p ~/tmp

# note: mksh and (o/pd)ksh have in compatible formats
HISTFILE="$HOME/var/ksh_history"
HISTSIZE=1024

# welcome
uname -sm
[ -x "$(command -v fortune)" ] && fortune


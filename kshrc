#!/bin/ksh

[ -f ~/etc/aliases ] && . ~/etc/aliases

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

runshell()
{
ps $$ | tail -n 1 | sed 's/.*://g' | cut -c 4-
}

_PS1DIR()
{
case "$PWD" in
	"$HOME")
		PS1DIR="~";;
	"/")
		PS1DIR="/";;
	*)
		PS1DIR="${PWD##*/}";;
esac
echo "$PS1DIR"
}

PS1="\$(_PS1DIR) \$ "

[ -f ~/.profile ] || . ~/etc/profile
[ -f ~/etc/profile ] && cat ~/etc/profile > ~/.profile

[ -d ~/var ] || mkdir -p ~/var
[ -d ~/tmp ] || mkdir -p ~/tmp

# note: mksh and (o/pd)ksh have in compatible formats
HISTFILE="$HOME/var/ksh_history"
HISTSIZE=1024

#uname -sm
[ -x "$(command -v fortune)" ] && fortune


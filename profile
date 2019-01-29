#!/bin/sh
#
# gitlab.com/morgaux/etc
#

mkdir -p $HOME/bin
mkdir -p $HOME/etc
mkdir -p $HOME/var

# RUNSHELL function returns the run shell regardsless of the $SHELL variable
runshell(){
	ps $$ | tail -n 1 | sed 's/.*://g' | cut -c 4-
}

# set PATH so it includes user's private bin
PATH="$HOME/bin:$PATH"

if [ -f "$HOME/etc/kshrc" ]; then
	export ENV="$HOME/etc/kshrc"
fi

for i in nano vi vim ; do
	[ -x "$(command -v $i)" ] && EDITOR="$(which $i)" && break
done

export PATH HOME EDITOR


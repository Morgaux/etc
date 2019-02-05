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
	ln -sf $$HOME/etc/kshrc $$HOME/.kshrc
	ln -sf $$HOME/etc/kshrc $$HOME/.mkshrc
fi

if [ -f "$HOME/etc/vimrc" ]; then
	ln -sf $$HOME/etc/vimrc $$HOME/.vimrc
fi

for i in vim vi nano ; do
	[ -x "$(command -v $i)" ] || continue
	EDITOR="$(which $i)" && break
done

export PATH HOME EDITOR


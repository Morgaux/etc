#!/bin/sh
#
# gitlab.com/morgaux/etc
#

# return the running shell
runshell(){
	ps $$ | tail -n 1 | sed 's/.*://g' | cut -c 4-
}

# update git tracked files
gitPullDir()
{
	[ -x "$(command -v git)" ] && [ -d "$1" ] && [ -d "$1/.git" ] || return

	cd "$1"
	git pull
	cd -
}

# set PATH so it includes user's private bin
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# use kshrc if it exists
if [ -f "$HOME/etc/kshrc" ]; then
	export ENV="$HOME/etc/kshrc"
	ln -sf $HOME/etc/kshrc $HOME/.kshrc
	ln -sf $HOME/etc/kshrc $HOME/.mkshrc
fi

# link vimrc if it exists
if [ -f "$HOME/etc/vimrc" ]; then
	ln -sf $HOME/etc/vimrc $HOME/.vimrc
fi

# set EDITOR to most prefered available
for i in vim vi nano ; do
	[ -x "$(command -v $i)" ] || continue
	EDITOR="$(which $i)" && break
done

# export variables
export PATH HOME EDITOR


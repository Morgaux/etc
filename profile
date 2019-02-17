#!/bin/sh
#
# gitlab.com/morgaux/etc
#

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


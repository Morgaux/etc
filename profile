#!/bin/sh

# set PATH so it includes user's private bin
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# set EDITOR to most prefered available
for i in vim vi nano ; do
	[ -x "$(command -v $i)" ] || continue
	EDITOR="$(which $i)" && break
done

# create symlinks if missing
[ -f ~/etc/kshrc ] && [ ! -L ~/.kshrc ] && ln -sf ~/etc/kshrc ~/.kshrc
[ -f ~/etc/kshrc ] && [ ! -L ~/.kshrc ] && ln -sf ~/etc/kshrc ~/.mkshrc
[ -f ~/etc/vimrc ] && [ ! -L ~/.vimrc ] && ln -sf ~/etc/vimrc ~/.vimrc

# export variables
export PATH HOME EDITOR

[ -x "$(command -v xbanish)" ] && xbanish &


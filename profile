#!/bin/sh

#
# http://gitlab.com/morgaux/etc
#

##
# ~/.profile generator
##

set -e # stop on uncaught error

##
# Warning message
##
{
	echo '#!/bin/sh'
	echo ''
	echo '##                                                                           ##'
	echo '#                              !!! IMPORTANT !!!                              #'
	echo '#                                                                             #'
	echo '#               DO NOT MODIFY - FILE GENERATED BY ~/etc/profile               #'
	echo '#                                                                             #'
	echo '##                                                                           ##'
	echo ''
} > ~/.profile.tmp # Create new temporary file

##
# add environment setup scripts to temporary file
##
for file in startup environment directory aliases; do
	sed -n '/#!\/bin/!p' ~/etc/$file >> ~/.profile.tmp || exit 1
done

##
# auto startx, MUST be last section added
##
{
	echo ''
	echo 'if	[ -z "$DISPLAY" ] && \\'
	echo '	[ "$XDG_VTNR" -eq 1 ] && \\'
	echo '	[ -x "$(command -v startx)" ]'
	echo 'then'
	echo '	exec startx'
	echo 'fi'
	echo ''
} >> ~/.profile.tmp

##
# replace old file
##
[ -f ~/.profile ] && cat ~/.profile > ~/.profile.bak

rm -f ~/.profile

mv ~/.profile.tmp ~/.profile

[ -f ~/.profile ] || cat ~/.profile.bak > ~/.profile

exit 0


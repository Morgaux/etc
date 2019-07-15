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
	echo 'CURRENT_SHELL="$(ps -p "$$" | tail -1 | awk "{print $4}" || basename "$SHELL")"'
	echo 'export CURRENT_SHELL'
	echo ''
} > ~/.profile.tmp # Create new temporary file

##
# add environment setup scripts to temporary file
##
for file in startup environment directory aliases welcome
do
	sed -n '/#!\/bin/!p' ~/etc/$file >> ~/.profile.tmp || exit 1
done

##
# auto startx, MUST be last section added
##
{
	echo ''
	echo 'if	[ -z "$DISPLAY" ] &&'
	echo '	[ "$XDG_VTNR" -eq 1 ] &&'
	echo '	[ -x "$(command -v startx)" ]'
	echo 'then'
	echo '	START="$(date +%s)"'
	echo '	END="$START"'
	echo '	_DELTA_T="1"'
	echo '	_TIMEOUT="3"'
	echo '	echo "~/.profile: Starting X in..."'
	echo '	while [ "$_DELTA_T" -lt "$_TIMEOUT" ]'
	echo '	do'
	echo '		END="$(date +%s)"'
	echo '		_DELTA_T="$((END - START))"'
	echo '		echo "$((_TIMEOUT - _DELTA_T))"'
	echo '		sleep 1'
	echo '	done'
	echo '	startx'
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


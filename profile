#!/bin/sh

#
# http://gitlab.com/morgaux/etc
#

##
# ~/.profile generator
##

set -e # stop on uncaught error

~/bin/log "Generating ~/.profile..."

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
	echo '~/bin/log "Running ~/.profile" || true'
	echo '~/bin/log "Uptime: $(uptime)" || true'
	echo '~/bin/log "Machine: $(uname -sm)" || true'
} > ~/.profile.tmp # Create new temporary file

##
# add environment setup scripts to temporary file
##
for file in environment directory aliases; do
	sed -n '/#!\/bin/!p' ~/etc/$file >> ~/.profile.tmp || exit 1
done

##
# replace old file
##
rm ~/.profile || ~/bin/log "Error occured in removing file"
mv ~/.profile.tmp ~/.profile || ~/bin/log "Error occured in moving file"

exit 0


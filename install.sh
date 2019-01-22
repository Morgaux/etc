#!/bin/sh
#
# http://gitlab.com/morgaux/etc
#
# Installs etc files
#
##

# Definitions
SELFNAME = '~/etc Installer'
SELFVER = "1.0.0"

# Functions

main()
{
	usage
}

usage()
{
	echo "$SELFNAME - v $SELFVER"
	echo "usage:"
	echo "./install.sh [OPTIONS]"
	echo "options:"
	echo "-h | --help	show this message"
	exit 0
}

main $@

exit $?


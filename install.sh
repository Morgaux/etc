#!/bin/sh
#
# http://gitlab.com/morgaux/etc
#
# Installs etc files
#
##

# Definitions
NAME="~/etc Installer"
VERSION="1.0.0"
MESG="Installer commit"

# Functions

main()
{
	readFlags $@
}

usage()
{
	echo "$NAME - v$VERSION"
	echo "usage:"
	echo "./install.sh [ OPTIONS ... ] DIRECTORY"
	echo ""
	echo "options:"
	echo "-h | --help	show this message"
	echo ""
	exit 0
}

readFlags()
{
	while [ $# -gt 0 ] ; do
		case $1 in
			-h|--help)
				usage
				;;
			-c|--commit)
				selfCommit
				shift
				;;
		esac
	done
}

selfCommit()
{
	[ -x "$(command -v git)" ] || die "git not installed"
	git add .
	git commit -m "$MESG"
}

die()
{
	echo "$NAME: FATAL: $@" 1>&2
	exit 1
}

main $@

exit $?


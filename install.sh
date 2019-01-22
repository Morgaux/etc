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
	echo "-h, --help		show this message"
	echo "-c message		commit local changes"
	echo "-p message		push commits to repo"
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
				if [ $# -gt 0 ] ; then
					MESG="$1"
					shift
				else
					die "-c flag requires 1 possitional arg"
				fi
				;;
			-p|--push)
				selfPush
				shift
				if [ $# -gt 0 ] ; then
					MESG="$1"
					shift
				fi
				;;
		esac
	done
}

selfCommit()
{
	[ -x "$(command -v git)" ] || die "git not installed"
	git add .
	git diff-index --quiet HEAD -- || git commit -m "$MESG"
}

selfPush()
{
	selfCommit
	until git push ; do
		echo "Retrying" 1>&2
	done
}

die()
{
	echo "$NAME: FATAL: $@" 1>&2
	exit 1
}

main $@

exit $?


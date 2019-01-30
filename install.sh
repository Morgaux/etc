#!/bin/sh

##
#
# http://gitlab.com/morgaux/etc
#
# Installs etc files
#
##

# Definitions
SRCDIR="$(dirname $(readlink -f "$0"))"
NAME="~/etc Installer"
VERSION="1.0.0"
MESG="Installer commit"

# Functions

main()
{
	[ -d "$HOME"/etc ] || mkdir "$HOME/etc"
	[ $# -gt 0 ] && readFlags $@ || usage
}

usage()
{
	echo "$NAME v$VERSION - usage:"
	echo "./install.sh [ -h ] | [ -i ]"
	echo ""
	echo "options:"
	echo "-h, --help		show this message"
	echo "-i, --install		install etc files"
	exit 0
}

readFlags()
{
	while [ $# -gt 0 ] ; do
		case $1 in
			-h|--help)
				usage # exit implicit
				;;
			-i|--install)
				shift
				installHome
				;;
			*)
				die "$1 option unknown"
		esac
	done
}

installHome()
{
	echo "Installing profile..."
	cp -uf $SRCDIR/profile ~/.profile
	for i in kshrc vimrc ; do
		echo "Installing $i..."
		cp -uf $SRCDIR/$i ~/etc/$i
	done
	ln -sf ~/etc/kshrc ~/.kshrc
	ln -sf ~/etc/kshrc ~/.mkshrc
	ln -sf ~/etc/vimrc ~/.vimrc
}

installxenodm()
{
	rcctl enable xenodm
	echo 'xset b off' >> /etc/X11/xenodm/Xsetup
	echo 'xsetroot -solid black' >> /etc/X11/xenodm/Xsetup
	sed -i 's/xconsole/#xconsole/' /etc/X11/xenodm/Xsetup_0
}

die()
{
	echo "$NAME: error: $@" 1>&2
	exit 1
}

main $@

exit $?


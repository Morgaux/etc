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
	[ $# -gt 0 ] && readFlags $@ || usage
}

usage()
{
	echo "usage:"
	echo "./install.sh [ -h ] | [ -c | -p  MESSAGE ] | [ -i ]"
	echo ""
	echo "options:"
	echo "-h, --help		show this message"
	echo "-c message		commit local changes"
	echo "-p message		push commits to repo"
	echo "-i, --install DIRECTORY	install etc files"
	echo ""
	echo "$NAME - v$VERSION"
	exit 0
}

readFlags()
{
	while [ $# -gt 0 ] ; do
		case $1 in
			-h|--help)
				usage # exit implicit
				;;
			-c|--commit)
				shift
				[ $# -gt 0 ] || die "-c requires message"
				MESG="$@"
				selfCommit
				exit $?
				;;
			-p|--push)
				shift
				[ $# -gt 0 ] || die "-p requires message"
				MESG="$@"
				selfPush
				exit $?
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
	mkdir -p $HOME/etc
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

selfCommit()
{
	[ -x "$(command -v git)" ] || die "git not installed"
	echo "Adding changes..."
	git add .
	echo "Commiting changes \"$MESG\""
	git diff-index --quiet HEAD -- || git commit -m "$MESG"
}

selfPush()
{
	selfCommit
	echo "Pushing commit..."
	git log --oneline -1
	#git push
	until git push ; do
		echo "Retrying" 1>&2
	done
}

die()
{
	echo "$NAME: error: $@" 1>&2
	exit 1
}

main $@

exit $?


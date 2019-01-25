#!/bin/sh

##
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
	[ $# -gt 0 ] && readFlags $@ || usage
}

usage()
{
	echo "usage:"
	echo "./install.sh [ -h ] | [ -c | -p  MESSAGE ] | [ -i DIRECTORY ]"
	echo ""
	echo "options:"
	echo "-h, --help		show this message"
	echo "-c message		commit local changes"
	echo "-p message		push commits to repo"
	echo "-i, --install DIRECTORY	install etc/DIRECTORY files"
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
				while [ $# -gt 0 ] ; do
					selfInstall $1
					shift
				done
				;;
			*)
				die "$1 option unknown"
		esac
	done
}

selfInstall()
{
	if [ -d $1 ] ; then
		echo "Installing $1 files..."
		install$1
		return
	fi
	die "directory $1 not found"
}

installhome()
{
	needDir $HOME/etc
	echo "Installing profile..."
	cp -uf ~/src/etc/home/profile ~/.profile || echo "Skipping profile..."
	for i in aliases kshrc vimrc ; do
		echo "Installing $i..."
		cp -uf ~/src/etc/home/$i ~/etc/$i || echo "Skipping $i..."
	done
	ln -sf ~/etc/kshrc ~/.kshrc
	ln -sf ~/etc/kshrc ~/.mkshrc
	ln -sf ~/etc/vimrc ~/.vimrc
}

installvim()
{
	needDir $HOME/.vim/colors
	echo "Installing colors..."
	cp -uf ~/src/etc/vim/colors/* ~/.vim/colors/.
}

needDir()
{
	[ -d "$1" ] || mkdir -p $1
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


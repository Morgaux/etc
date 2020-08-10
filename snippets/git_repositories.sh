#!/bin/sh

# $1 = repo URL
# $2 = target directory (base dir, not including repo dir)
clone_or_pull_to() {(
	URL="$1" ;
	REPO_DIR="$(basename "$1")" ;
	BASE_DIR="$2" ;
	FULL_DIR="$BASE_DIR/$REPO_DIR"

	mkdir -p "$BASE_DIR" ;

	if [ -d "$FULL_DIR" ] ;
	then
		cd "$FULL_DIR" && git pull &
	else
		cd "$BASE_DIR" && git clone "$URL" &
	fi >/dev/null 2>&1 ;
)}

if [ -x "$(command -v git)" ]
then
	clone_or_pull_to "https://gitlab.com/morgaux/bin"         "$HOME"
	clone_or_pull_to "https://gitlab.com/morgaux/sude"        "$HOME/src"
	clone_or_pull_to "https://gitlab.com/morgaux/kata"        "$HOME/src"
	clone_or_pull_to "https://github.com/martanne/dvtm"       "$HOME/src"
	clone_or_pull_to "https://gitlab.com/morgaux/wolfenstein" "$HOME/src"
fi


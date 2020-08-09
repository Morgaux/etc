#!/bin/sh

if [ -x "$(command -v xdg-user-dirs-update)" ]
then
	# Destination directories
	XDG_DESKTOP_DIR="$HOME/var/Desktop"
	XDG_DOCUMENTS_DIR="$HOME/var/Documents"
	XDG_DOWNLOAD_DIR="$HOME/var/Downloads"
	XDG_MUSIC_DIR="$HOME/var/Music"
	XDG_PICTURES_DIR="$HOME/var/Pictures"
	XDG_PUBLICSHARE_DIR="$HOME/var/Public"
	XDG_TEMPLATES_DIR="$HOME/var/Templates"
	XDG_VIDEOS_DIR="$HOME/var/Videos"

	for XDG_DIR in                 \
		"$XDG_DESKTOP_DIR"     \
		"$XDG_DOCUMENTS_DIR"   \
		"$XDG_DOWNLOAD_DIR"    \
		"$XDG_MUSIC_DIR"       \
		"$XDG_PICTURES_DIR"    \
		"$XDG_PUBLICSHARE_DIR" \
		"$XDG_TEMPLATES_DIR"   \
		"$XDG_VIDEOS_DIR"
	do
		mkdir -p "$XDG_DIR"
	done

	xdg-user-dirs-update --set DESKTOP     "$XDG_DESKTOP_DIR"
	xdg-user-dirs-update --set DOCUMENTS   "$XDG_DOCUMENTS_DIR"
	xdg-user-dirs-update --set DOWNLOAD    "$XDG_DOWNLOAD_DIR"
	xdg-user-dirs-update --set MUSIC       "$XDG_MUSIC_DIR"
	xdg-user-dirs-update --set PICTURES    "$XDG_PICTURES_DIR"
	xdg-user-dirs-update --set PUBLICSHARE "$XDG_PUBLICSHARE_DIR"
	xdg-user-dirs-update --set TEMPLATES   "$XDG_TEMPLATES_DIR"
	xdg-user-dirs-update --set VIDEOS      "$XDG_VIDEOS_DIR"

	xdg-user-dirs-update

	for DIR in          \
		"Desktop"   \
		"Documents" \
		"Downloads" \
		"Music"     \
		"Pictures"  \
		"Public"    \
		"Templates" \
		"Videos"
	do
		if [ -d "${HOME}/${DIR}" ] &&
			[ -d "${HOME}/var/${DIR}" ]
		then
			mv "${HOME}/${DIR}"/*      \
			   "${HOME}/${DIR}"/.[!.]* \
			   "${HOME}/${DIR}"/..?*   \
			   "${HOME}/var/${DIR}"/.
			rm -rf "${HOME:?}/${DIR}"
		fi
	done
fi


#!/bin/sh

({ # Begin async block
	# Configure the spelling locations
	COMMIT_MESSAGE="Automatic spelling commit"
	SPELL_DIR="vim/spell"
	ETC_DIR="${HOME}/etc"
	TMP_DIR="${HOME}/tmp"

	# These dirs must exist to continue
	if [ ! -d "$TMP_DIR" ] || [ ! -d "${ETC_DIR}/${SPELL_DIR}" ]
	then
		return
	fi

	# Prepare each file
	for spell_file in "${ETC_DIR}/${SPELL_DIR}"/*.add
	do
		# Get significant filename
		ADD_FILE="$(basename "$spell_file")"

		# Create a temp file with unique entries in order
		sort -i "$spell_file" | uniq > "${TMP_DIR}/${ADD_FILE}.tmp"

		# Strip out conflicts and re-create original file
		grep -Ev "<<|>>|==" "${TMP_DIR}/${ADD_FILE}.tmp" > "$spell_file"

		# Remove temp file
		rm -f "${TMP_DIR}/${ADD_FILE}.tmp"
	done

	# Spawn subshell to go to the ETC_DIR and commit the changes
	( cd "$ETC_DIR" && git commit -m "$COMMIT_MESSAGE" "$SPELL_DIR" )
} </dev/null >/dev/null 2>&1 & )


#!/bin/sh

_WELCOME_COMMAND="uf" # run this command for the first terminal opened recently
_LAST_LOGIN_FILE="${HOME}/.logintimestamp"

# Ensure timestamp file exists
touch "${_LAST_LOGIN_FILE}"

# If the last login was more than X seconds ago, run the _WELCOME_COMMAND
if [ "$(($(date +%s) - 3600))" -gt "$(head -n 1 "${_LAST_LOGIN_FILE}")" ]
then
	if [ -x "$(command -v "$_WELCOME_COMMAND")" ]
	then
		sh -c $_WELCOME_COMMAND
	fi
fi

# Update the last login time stamp
date +%s > "${_LAST_LOGIN_FILE}" # UNIX timestamp format


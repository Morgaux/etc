#!/bin/ksh

# Here the file extension given to the history file should match the shell
# being run, e.g. to distinguish between an mksh(1) and pdksh(1) session,
# however, to avoid distinguishing mksh(1) and -mksh(1) sessions, only the
# letters and digits of the CURRENT_SHELL value should be used to construct the
# extension. The ${VAR//pattern/replace} usecase shellcheck recommends doesn't
# work in this case, so ignore the shellcheck warning and manually sed(1) it.
# shellcheck disable=SC2001
HISTFILE="$HOME/var/history.$(echo "$CURRENT_SHELL" | sed 's/[^a-zA-Z0-9-]//g')"
HISTSIZE=1024

export HISTFILE
export HISTSIZE


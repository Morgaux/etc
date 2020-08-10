#!/bin/sh

CURRENT_SHELL="$(ps | awk "/$$/ {print \$NF; exit 0}")"
export CURRENT_SHELL


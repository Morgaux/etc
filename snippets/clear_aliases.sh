#!/bin/sh

for i in ls la ll
do
	# For these commands, assume that for 'foo', 'cfoo' means clear the
	# screen and then run 'foo'. Shellcheck complains about the variable
	# expansion here but it's perfectly fine in this case.
	# shellcheck disable=SC2139
	alias "c${i}=clear; ${i}"
done


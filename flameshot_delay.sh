#!/usr/bin/env bash

set -Eeuo pipefail

if [[ $# -gt 0 ]]; then
	DURATION=$1
else
	echo 'enter in a duration in milliseconds'
	exit 1
fi

flameshot full -d $DURATION -p /home/sudacode/Pictures/flameshot/

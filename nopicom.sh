#!/usr/bin/env bash

set -Eeuo pipefail

isVerbose=0
if [[ $# -gt 0 && $1 == '-v' ]]; then
	isVerbose=1
fi

if [[ $(pgrep -x picom) != '' ]]; then
	PID=$(pidof "picom")
	if [[ $isVerbose -eq 1 ]]; then
		echo 'Found running instance of picom with pid' $PID
	fi
	kill -9 $PID
fi

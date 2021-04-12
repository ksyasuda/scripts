#!/usr/bin/env bash

set -Euo pipefail

if [[ $# -ne 1 ]]; then
	echo 'must enter in name of process'
	exit 1
fi

PROCESS=$1
PID=$(pidof $PROCESS)
if [[ $PID == "" ]]; then
	echo "'$PROCESS' not found"
	exit 1
fi

kill -9 $PID
printf "Killed '$PROCESS' with pid $PID\n"

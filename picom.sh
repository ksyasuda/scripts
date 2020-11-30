#!/bin/bash

# script to launch a new instance of picom in the background

set -Euo pipefail
# set -Eeuo pipefail
# remove the e argument so that it does not stop on any command failure
# e.g. having no picom running and having line 15 return non 0 return code

verbose=0
if [[ $# -gt 0 && $1 == "-v" ]]; then
	verbose=1
fi

res=$(pgrep -x picom)
if [[ $res  != '' ]]; then
	pid=$(pidof picom)
	if [[ $verbose -eq 1 ]]
	then
		echo 'killing process pid '$pid
	fi
	kill -9 $pid
	while pgrep -x picom >/dev/null; do sleep 1;
	done
fi

picom &
if [[ $verbose -eq 1 ]] 
then
	pid=$(pidof picom)
	echo 'launched new instance of picom with pid '$pid
fi

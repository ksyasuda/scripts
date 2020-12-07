#!/usr/bin/env bash

set -Eeuo pipefail

isVerbose=0
if [[ $# -gt 0 && $1 == '-v' ]]; then
	isVerbose=1
fi

if [[ $isVerbose -eq 1 ]]; then
	~/Downloads/slippi_online-x86_64.AppImage &
else
	~/Downloads/slippi_online-x86_64.AppImage &>/dev/null &
fi


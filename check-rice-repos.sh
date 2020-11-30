#!/usr/bin/env bash

set -Euo pipefail

function needsUpdate () {
	dir=$1
	cd $dir 
	x=$(git status | grep "nothing to commit, working tree clean")
	if [[ $? -eq 1 ]]; then
		echo 'You should update your git in '$dir
		return 1
	fi
	return 0
}

directories=('/home/sudacode/dotfiles' '/home/sudacode/i3' '/home/sudacode/scripts')

isClean=1
for i in "${directories[@]}"; do
	needsUpdate $i
	if [[ $? -eq 1 ]]; then
		isClean=0
	fi
done

if [[ $isClean -eq 1 ]]; then
	echo 'All directories clean, good luck Freud'
fi

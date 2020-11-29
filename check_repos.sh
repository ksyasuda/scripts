#!/usr/bin/env bash

set -Euo pipefail

needsUpdate() {
	dir=$1
	cd $dir 
	x=$(git status | grep "nothing to commit, working tree clean")
	if [[ $? -eq 1 ]]; then
		echo 'You should update your git in '$dir
	fi
}

directories=('/home/sudacode/dotfiles' '/home/sudacode/i3' '/home/sudacode/scripts')

for i in "${directories[@]}"; do
	needsUpdate $i
done

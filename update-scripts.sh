#!/usr/bin/env bash

set -Euo pipefail

DIR=~/scripts/

(
	cd $DIR
	if [[ $(git status | grep 'nothing to commit, working tree clean') != '' ]]
	then
		echo 'Nothing to commit, repo updated'
		exit 0
	fi

	git add .
	git commit -m "Automated udate of the scrips repo"
	git push
)


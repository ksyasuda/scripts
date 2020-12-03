#!/usr/bin/env bash

set -Euo pipefail

DIR=~/scripts/

if [[ $(git status | grep 'nothing to commit, working tree clean') != '' ]]
then
	echo 'Nothing to commit, repo updated'
	exit 0
fi

(
	cd $DIR
	git add .
	git commit -m "Automated udate of the scrips repo"
	git push
)


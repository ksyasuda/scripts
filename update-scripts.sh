#!/usr/bin/env bash

set -Euo pipefail

DIR=~/scripts/

(
	cd $DIR
	git add .
	git commit -m "Automated udate of the scrips repo"
	git push
)


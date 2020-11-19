#!/bin/bash

set -Eeuo pipefail

DIR=~/Pictures/wallpapers/

img=$(ls $DIR | shuf -n 1)

if [[ $# -gt 0 && $1 == "-v" ]]; then
	echo $img
fi

feh --bg-scale $DIR$img

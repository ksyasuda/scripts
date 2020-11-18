#!/bin/bash
set -Eeuo pipefail

if [[ $# -ne 1 ]]; then
	echo 'usage: filename [filename]'
	exit 1
fi

filename=$1
filename="${filename%.*}"
echo $filename

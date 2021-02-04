#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo 'usage extension [filename]'
	exit 1
fi

filename=$1
extension="${filename##*.}"
echo $extension
exit 0

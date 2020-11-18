#!/usr/bin/bash

set -Eeuo pipefail

for file in $(ls); do
	filename=$(filename $file)
	extension=$(extension $file)
	if [[ $extension != "sh" ]]; then
		ln -sr $filename.$extension /home/sudacode/.config/polybar/modules/$filename.$extension
		echo 'Created symlink for' $filename.$extension
	fi
done

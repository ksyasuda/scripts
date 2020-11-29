#!/usr/bin/env bash

set -Eeuo pipefail

path=~/Pictures/flameshot/

flameshot full -p $path >/dev/null

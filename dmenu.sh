#!/usr/bin/env bash
set -Eeuo pipefail

# run dmenu with 32 px height dodgerblue background and green foreground
dmenu_run -h 70 -p Freud -sb dodgerblue -sf green -fn "Terminus-14:regular"

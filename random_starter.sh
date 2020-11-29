#!/usr/bin/env bash

set -Eeuo pipefail

commands=(screenfetch neofetch archey3 cowtune pfetch)
NUM_ITEMS=${#commands[*]}
rand=$(echo $(($RANDOM % $NUM_ITEMS )))
chosen=echo ${commands[$rand]}

#!/usr/bin/env bash

# Stop on errors, print commands
# See https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -Eeuo pipefail
set -x

cd ~/projects/react/github/website2.0
code .
npm start

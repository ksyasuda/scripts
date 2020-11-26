#!/usr/bin/env bash
set -Eeuo pipefail

if [[ $# -gt 0 && $1 == "-v" ]]; then
	bluetoothctl power on && bluetoothctl connect 24:1B:7A:ED:ED:78
	exit 0
fi
bluetoothctl power on >/dev/null && bluetoothctl connect 24:1B:7A:ED:ED:78 >/dev/null

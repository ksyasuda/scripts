#!/usr/bin/env bash
set -Eeuo pipefail

if [[ $# -gt 0 && $1 == "-v" ]]; then
	bluetoothctl power on && bluetoothctl connect 24:1B:7A:ED:ED:78
	exit 0
fi

if [ "$(bluetoothctl power on >/dev/null && bluetoothctl connect 24:1B:7A:ED:ED:78 >/dev/null)" -eq 0 ]; then
	~/i3/scripts/bluetooth_notifications.py "connected" "Kyle\'s Airpods"	
else
	echo 'not nice'
fi

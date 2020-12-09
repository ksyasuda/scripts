#!/usr/bin/env bash

if [[ $# -gt 0 && $1 == '-v' ]]; then
	bluetoothctl power on && bluetoothctl connect A4:15:66:62:EF:3D 
	exit 0
fi

bluetoothctl power on &>/dev/null && bluetoothctl connect A4:15:66:62:EF:3D &>/dev/null

#!/bin/bash

BAR_ICON=""

x=$(pamac checkupdates --aur 2>/dev/null | grep available) 

if [[ $x != "" ]]; then
	echo $BAR_ICON ${x::-1}
else
	stuff=$(pamac checkupdates 2>/dev/null | grep -1 'up-to-date')
	echo $BAR_ICON ${stuff::-1}
fi

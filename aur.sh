#!/bin/bash

x=$(pamac checkupdates --aur 2>/dev/null | grep available)
echo $x

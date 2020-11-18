#!/bin/bash

# Custom Rofi Script

BORDER="#1F1F1F"
SEPARATOR="#1F1F1F"
FOREGROUND="#A9ABB0"
BACKGROUND="#1F1F1F"
# BACKGROUND_ALT="#252525"
BACKGROUND_ALT="#282c34"
HIGHLIGHT_BACKGROUND="#56a7b5"
# HIGHLIGHT_BACKGROUND="#311B92"
# HIGHLIGHT_FOREGROUND="#FFFFFF"
HIGHLIGHT_FOREGROUND="#a8d385"

BLACK="#000000"
WHITE="#ffffff"
RED="#e53935"
GREEN="#43a047"
YELLOW="#fdd835"
BLUE="#1e88e5"
MAGENTA="#00897b"
CYAN="#00acc1"
PINK="#d81b60"
PURPLE="#8e24aa"
INDIGO="#3949ab"
TEAL="#00897b"
LIME="#c0ca33"
AMBER="#ffb300"
ORANGE="#fb8c00"
BROWN="#6d4c41"
GREY="#757575"
BLUE_GREY="#546e7a"
DEEP_PURPLE="#5e35b1"
DEEP_ORANGE="#f4511e"
LIGHT_BLUE="#039be5"
LIGHT_GREEN="#7cb342"

# Launch Rofi
rofi -no-lazy-grab -show window \
-display-drun "Applications :" -drun-display-format "{name}" \
-hide-scrollbar true \
-bw 0 \
-lines 12 \
-line-padding 8 \
-padding 20 \
-width 30 \
-xoffset 27 -yoffset 60 \
-location 1 \
-columns 2 \

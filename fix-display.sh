#!/bin/bash

# You must change this to match the identifier of your computer's monitor.
MONITOR_IDENTIFIER='eDP-2'

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    kscreen-doctor output.${MONITOR_IDENTIFIER}.mode.2560x1600@60
    kscreen-doctor output.${MONITOR_IDENTIFIER}.mode.2560x1600@165
else
    xrandr --output ${MONITOR_IDENTIFIER} --mode 2560x1600 --rate 60
    xrandr --output ${MONITOR_IDENTIFIER} --mode 2560x1600 --rate 165
fi

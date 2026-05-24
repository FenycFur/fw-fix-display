#!/bin/bash
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    kscreen-doctor output.eDP-2.mode.2560x1600@165
else
    echo hi1
    xrandr --output eDP-2 --mode 2560x1600 --rate 60
    echo hi2
    sleep 0.5
    echo hi3
    xrandr --output eDP-2 --mode 2560x1600 --rate 165
    echo hi4
fi

#!/bin/bash
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    kscreen-doctor output.eDP-2.mode.2560x1600@60
    kscreen-doctor output.eDP-2.mode.2560x1600@165
else
    xrandr --output eDP-2 --mode 2560x1600 --rate 60
    xrandr --output eDP-2 --mode 2560x1600 --rate 165
fi

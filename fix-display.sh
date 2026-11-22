#!/bin/bash
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    kscreen-doctor output.eDP-2.mode.2560x1600@60
    kscreen-doctor output.eDP-2.mode.2560x1600@165
else
    # detect the actual internal display name (e.g. eDP or eDP-2), which varies by device
    output=$(xrandr --listmonitors | grep -oE 'eDP[^ ]*' | head -n1)
    xrandr --output "$output" --mode 2560x1600 --rate 60
    xrandr --output "$output" --mode 2560x1600 --rate 165
fi

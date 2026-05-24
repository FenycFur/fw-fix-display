#!/bin/bash
dbus-monitor --system "type='signal',interface='org.freedesktop.login1.Manager',member=PrepareForSleep" | while read x; do
    case "$x" in
        *"boolean false"*) # wake
            systemctl --user --no-block start sleep.target;
            sleep 0.5;
            systemctl --user --no-block stop  sleep.target;
            ;;
        # *"boolean true"*) # sleep
            # systemctl --user --no-block start sleep.target
            # ;;
    esac
done

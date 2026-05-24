chmod +x ~/.config/systemd/user/watch_sleep.sh
systemctl --user daemon-reload
systemctl --user enable watch_sleep.service fix-display.service
systemctl --user start watch_sleep.service

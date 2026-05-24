SYSTEMD_USER_DIR := $(HOME)/.config/systemd/user

.PHONY: install uninstall

install:
	install -m 644 sleep.target        $(SYSTEMD_USER_DIR)/sleep.target
	install -m 644 watch_sleep.service $(SYSTEMD_USER_DIR)/watch_sleep.service
	install -m 755 watch_sleep.sh      $(SYSTEMD_USER_DIR)/watch_sleep.sh
	install -m 644 fix-display.service $(SYSTEMD_USER_DIR)/fix-display.service
	install -m 755 fix-display.sh      $(SYSTEMD_USER_DIR)/fix-display.sh
	systemctl --user daemon-reload
	systemctl --user enable watch_sleep.service fix-display.service
	systemctl --user start  watch_sleep.service

uninstall:
	systemctl --user stop    watch_sleep.service || true
	systemctl --user disable watch_sleep.service fix-display.service || true
	rm -f $(SYSTEMD_USER_DIR)/sleep.target
	rm -f $(SYSTEMD_USER_DIR)/watch_sleep.service
	rm -f $(SYSTEMD_USER_DIR)/watch_sleep.sh
	rm -f $(SYSTEMD_USER_DIR)/fix-display.service
	rm -f $(SYSTEMD_USER_DIR)/fix-display.sh
	systemctl --user daemon-reload

#! /bin/bash

EVDEV=/usr/share/X11/xkb/keycodes/evdev
# Backup original, then switch caps and F12 codes (66/96)
sudo sed -i.bak -r 's/\s66/_tmp_/g' $EVDEV
sudo sed -i -r 's/\s96/ 66/g' $EVDEV
sudo sed -i -r 's/_tmp_/ 96/g' $EVDEV
# Reload evdev for take changes into account
setxkbmap -layout us
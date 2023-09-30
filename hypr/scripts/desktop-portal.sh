#!/bin/bash
sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
/usr/libexec/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
export MOZ_DBUS_REMOTE=1
dbus-update-activation-environment --systemd DISPLAY MOZ_DBUS_REMOTE

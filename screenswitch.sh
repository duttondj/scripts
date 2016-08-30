#!/bin/sh

xrandr --output VGA1 --off --output LVDS1 --auto

i3-nagbar -m "SWITCH MONITORS" -t warning \
	-b "LAPTOP"  "xrandr --output VGA1 --off --output LVDS1 --auto" \
	-b "MONITOR"  "xrandr --output LVDS1 --off --output VGA1 --auto"

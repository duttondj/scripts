#!/bin/sh

#Look for VGA or displayport connected and being used.
#Assumes that only one of the connections is actually being used.
screenmode="$(xrandr| grep 'VGA')"

#check if VGA is connected and being used, turn vga off and lvds on if true
if echo "$screenmode" | grep -E 'connected [0-9]'; then
	xrandr --output LVDS1 --auto --output DP1 --off --output VGA1 --off
	exit 0
fi
#check if VGA is connected and is not being used, turn vga on and lvds off if true
if echo "$screenmode" | grep -E ' connected'; then
	xrandr --output LVDS1 --off --output DP1 --auto --output VGA1 --auto
	exit 0
fi
#vga is disconnected so enable lvds
xrandr --output LVDS1 --auto --output DP1 --off --output VGA1 --off
exit 0

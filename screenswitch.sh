#!/bin/sh

#Look for VGA or displayport connected and being used.
#Assumes that only one of the connections is actually being used.
screenmode="$(xrandr| grep -E 'VGA.\ connected [0-9]|DP.\ connected [0-9]' | awk '/1/ {print $1}')"

#Switch to laptop screen if VGA or DP is being used
#Switch to VGA and DP if laptop is being used
case "$screenmode" in
	VGA1)
		xrandr --output LVDS1 --auto --output DP1 --off --output VGA1 --off
	;;
	DP1)	
		xrandr --output LVDS1 --auto --output DP1 --off --output VGA1 --off
	;;
	*)
		xrandr --output LVDS1 --off --output DP1 --auto --output VGA1 --auto
	;;
esac

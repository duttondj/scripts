#!/bin/sh

# This script will switch between normal and right screen orientations.
# Additionally, it will orient the wacom panel to match the screen. It only
# will switch between normal and right because the other orientations are stupid.
# Ideally, this script would be controlled by a soft or hard button.
# This is specifically setup for the x200 but could be used for any similar device.

# Get wacom device list
SaveIFS="$IFS"
IFS=$'\n'
devices=($(xsetwacom list | awk -F  "\t" '/1/ {print $1}'))
IFS="$SaveIFS"

# Find the line in "xrandr -q --verbose" output that contains current screen orientation and "strip" out current orientation.
rotation="$(xrandr -q --verbose | grep 'connected' | egrep -o  '\) (normal|left|inverted|right) \(' | egrep -o '(normal|left|inverted|right)')"

# Using current screen orientation proceed to rotate screen and input tools.
case "$rotation" in
	normal)
		# rotate to the right
		xrandr -o right
		for i in "${devices[@]}"
		do
			xsetwacom set "$i" rotate cw
		done
	;;
	right)
		# rotate to normal
		xrandr -o normal
		for i in "${devices[@]}"
		do
			xsetwacom set "$i" rotate none
		done
	;;
esac

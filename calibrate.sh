#!/bin/bash

# This bash script will calibrate the wacom panel to the correct settings as
# the default settings really suck. The stylus/eraser are off by a bit and the
# touch is off by quite a lot.
#
# Since the names of the devices seem to change randomly, this will also
# try to grab the current names.
#
# These numbers have been determined using xinput_calibrator.

stylus="$(xsetwacom list | grep -E 'stylus' | awk -F  "\t" '{print $1}')"
eraser="$(xsetwacom list | grep -E 'eraser' | awk -F  "\t" '{print $1}')"
touch="$(xsetwacom list | grep -E 'finger|Finger|touch' | awk -F  "\t" '{print $1}')"

xsetwacom set "$stylus" Area 168 133 26288 16418
xsetwacom set "$eraser" Area 98 36 26204 16432
xsetwacom set "$touch" Area 858 1154 24498 15336

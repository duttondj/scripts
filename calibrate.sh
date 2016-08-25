#!/bin/bash

# This bash script will calibrate the wacom panel to the correct settings as
# the default settings really suck. The stylus/eraser are off by a bit and the
# touch is off by quite a lot.
#
# These numbers have been determined using xinput_calibrator.

xsetwacom set "Wacom Serial Penabled 1FG Touchscreen Pen stylus" Area 168 133 26288 16418
xsetwacom set "Wacom Serial Penabled 1FG Touchscreen Pen eraser" Area 98 36 26204 16432
xsetwacom set "Wacom Serial Penabled 1FG Touchscreen Finger touch" Area 858 1154 24498 15336

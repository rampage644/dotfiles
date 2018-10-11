#!/usr/bin/env bash
LEFT_GEOMETRY=$(xrandr | grep LVDS1 | awk '{print $3}')
# 4th field is because monitor is primary
RIGHT_GEOMETRY=$(xrandr | grep DP3 | awk '{print $4}')
ICON=/home/ramp/lock_icon.png
# Taking screenshot and blur it
TEMP=/tmp/screen.png
scrot $TEMP
convert $TEMP -scale 10% -scale 1000% $TEMP

# Create left part of image
TEMP1=/tmp/screen1.png
convert $TEMP -crop $LEFT_GEOMETRY $TEMP1
convert $TEMP1 $ICON -gravity center -composite -matte $TEMP1

# Create right part of image
TEMP2=/tmp/screen2.png
convert $TEMP -crop $RIGHT_GEOMETRY $TEMP2
convert $TEMP2 $ICON -gravity center -composite -matte $TEMP2

# Combine and lock
convert $TEMP1 $TEMP2 +append $TEMP
i3lock -u -i $TEMP

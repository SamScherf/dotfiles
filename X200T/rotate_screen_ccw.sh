#!/bin/sh

# Find the line in "xrandr -q --verbose" output that contains current screen orientation and "strip" out current orientation.
rotation="$(xrandr -q --verbose | grep 'connected' | egrep -m 1 -o  '\) (normal|left|inverted|right) \(' | egrep -o '(normal|left|inverted|right)')"

# Using current screen orientation proceed to rotate screen and input tools.
case "$rotation" in
    normal)
    # rotate to the left
    xrandr --output LVDS1 --rotate left
    xsetwacom set "Serial Wacom Tablet WACf004 stylus" rotate ccw
    xsetwacom set "Serial Wacom Tablet WACf004 eraser" rotate ccw
    ;;
    left)
    # rotate to inverted
    xrandr --output LVDS1 --rotate inverted
    xsetwacom set "Serial Wacom Tablet WACf004 stylus" rotate half
    xsetwacom set "Serial Wacom Tablet WACf004 eraser" rotate half
    ;;
    # rotate to right
    inverted)
    xrandr --output LVDS1 --rotate right
    xsetwacom set "Serial Wacom Tablet WACf004 stylus" rotate cw
    xsetwacom set "Serial Wacom Tablet WACf004 eraser" rotate cw
    ;;
    # rotate to normal
    right)
    xrandr --output LVDS1 --rotate normal
    xsetwacom set "Serial Wacom Tablet WACf004 stylus" rotate none
    xsetwacom set "Serial Wacom Tablet WACf004 eraser" rotate none
    ;;

esac


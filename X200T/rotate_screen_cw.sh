#!/bin/sh

# Find the line in "xrandr -q --verbose" output that contains current screen orientation and "strip" out current orientation.
rotation="$(xrandr -q --verbose | grep 'connected' | egrep -m 1 -o  '\) (normal|left|inverted|right) \(' | egrep -o '(normal|left|inverted|right)')"

# Using current screen orientation proceed to rotate screen and input tools.
case "$rotation" in
    normal)
    # rotate to the left
    xrandr --output LVDS1 --rotate right
    xsetwacom set "Wacom Serial Penabled Pen stylus" rotate cw
    xsetwacom set "Wacom Serial Penabled Pen eraser" rotate cw
    ;;
    right)
    # rotate to inverted
    xrandr --output LVDS1 --rotate inverted
    xsetwacom set "Wacom Serial Penabled Pen stylus" rotate half
    xsetwacom set "Wacom Serial Penabled Pen eraser" rotate half
    ;;
    # rotate to right
    inverted)
    xrandr --output LVDS1 --rotate left
    xsetwacom set "Wacom Serial Penabled Pen stylus" rotate ccw
    xsetwacom set "Wacom Serial Penabled Pen eraser" rotate ccw
    ;;
    # rotate to normal
    left)
    xrandr --output LVDS1 --rotate normal
    xsetwacom set "Wacom Serial Penabled Pen stylus" rotate none
    xsetwacom set "Wacom Serial Penabled Pen eraser" rotate none
    ;;

esac


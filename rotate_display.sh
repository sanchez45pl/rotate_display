#!/bin/bash

Display=`(xrandr |grep eDP|cut -d" " -f1)`
Touchpad="ELAN2301:00 04F3:306B Touchpad"
Transform='Coordinate Transformation Matrix'

if [ "$1" == "-i" ]; then
  echo "Upside down"
  xrandr --output "$Display" --rotate inverted
  xinput set-prop "$Touchpad" "$Transform" -1 0 1 0 -1 1 0 0 1
elif [ "$1" == "-l" ]; then
  echo "90° to the left"
  xrandr --output "$Display" --rotate left
  xinput set-prop "$Touchpad" "$Transform" 0 -1 1 1 0 0 0 0 1
elif [ "$1" == "-r" ]; then
  echo "90° to the right"
  xrandr --output "$Display" --rotate right
  xinput set-prop "$Touchpad" "$Transform" 0 1 0 -1 0 1 0 0 1
else
  echo "Back to normal"
  xrandr --output "$Display" --rotate normal
  xinput set-prop "$Touchpad" "$Transform" 1 0 0 0 1 0 0 0 1
fi
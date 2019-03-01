#!/bin/bash

BRIGHTNESS=`sudo cat /sys/class/backlight/intel_backlight/brightness`
NEW_BRIGHTNESS=$(($BRIGHTNESS-400))
sudo echo $NEW_BRIGHTNESS > /sys/class/backlight/intel_backlight/brightness

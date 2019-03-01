#!/bin/bash

TARGET=$(find /home/yann/webdev_local/ \( -name "*html" -o -name "*css" -o -name \
	"*php" \) | cut -d/ -f5,6,7 | dmenu -i -fn 'monospace:bold:pixelsize=30' -l 27 \
	-p "in webdev_local:")

if [ $TARGET != " " ]; then
	xfce4-terminal -e 'vim '/home/yann/webdev_local/$TARGET
fi

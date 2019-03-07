#!/bin/bash

TARGET=$(find /home/yann/scripts/ \( -name "*sh" \) | cut -d/ -f5 | dmenu -i -fn 'monospace:bold:pixelsize=30' -l 27 -p "Run script")

if [ $TARGET != " " ]; then
	xfce4-terminal -e '/home/yann/scripts/'$TARGET
fi

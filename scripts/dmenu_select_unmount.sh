#!/bin/bash

TARGET=$(lsblk | grep /media | awk '{print$NF}'| dmenu -i -fn 'monospace:bold:pixelsize=30' -l 27 -p "Mount:")

if [ -n "$TARGET" ]; then
	sudo umount "$TARGET"
fi

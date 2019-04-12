#!/bin/bash

TARGET=$(lsblk | grep /media | awk '{print$NF}'| sort | dmenu -i -fn 'monospace:bold:pixelsize=30' -l 27 -p "Umount:")

if [ -n "$TARGET" ]; then
	sudo umount "$TARGET"
fi

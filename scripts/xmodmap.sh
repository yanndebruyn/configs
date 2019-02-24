#! /bin/bash

# bind Delete to Caps_Lock
#setxkbmap -layout us -option ctrl:nocaps

xmodmap -e 'remove Lock = Caps_Lock'
xmodmap -e 'keysym Caps_Lock = Delete'
xmodmap -e 'add Lock = Caps_Lock'



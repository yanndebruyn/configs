#!/bin/bash


	
LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')


 if [[ "$LAYOUT" == "us" ]]; then

   setxkbmap be
	 /home/yann/scripts/xmodmap.sh

 elif [[ "$LAYOUT" == "be" ]]; then

	 setxkbmap us
	 /home/yann/scripts/xmodmap.sh

 fi

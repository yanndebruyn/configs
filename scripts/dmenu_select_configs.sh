#!/bin/bash

choices="i3_config\ni3_blocks_config\nranger_rc.conf\n.vimrc\n.bashrc\n.tmux.conf"

selected=$(echo -e "$choices" | dmenu -i -fn 'monospace:bold:pixelsize=35' -l 27 -p 'Edit dotfile')

case "$selected" in
	i3_config) xfce4-terminal -e 'vim /home/yann/.config/i3/config' ;;
	i3_blocks_config) xfce4-terminal -e 'vim /home/yann/.config/i3/i3blocks.conf' ;;
	ranger_rc.conf)  xfce4-terminal -e 'vim /home/yann/.config/ranger/rc.conf' ;;
	.vimrc) xfce4-terminal -e 'vim /home/yann/.vimrc' ;; 
	.bashrc) xfce4-terminal -e 'vim /home/yann/.bashrc' ;;  
	.tmux.conf) xfce4-terminal -e 'vim /home/yann/.tmux.conf' ;;  
esac

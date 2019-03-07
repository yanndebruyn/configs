#!/bin/bash

cp -r ~/.vimrc ~/.tmux.conf ~/.profile ~/.dircolors ~/.bashrc ~/scripts -t ~/git-repos/configs/
cp -r ~/.vim/spell ~/git-repos/configs/.vim/
cp /home/yann/.config/xfce4/terminal/terminalrc /home/yann/git-repos/configs/.config/xfce4/terminal/
cp -r /home/yann/.config/i3 /home/yann/git-repos/configs/.config/
cp -r /home/yann/.config/ranger /home/yann/git-repos/configs/.config/
cp -r /home/yann/.config/qutebrowser /home/yann/git-repos/configs/.config/
cp -r /etc/sudoers /home/yann/git-repos/etc/sudoers


#!/bin/bash
cp -r ~/Documents/* ~/Documents_backup/
echo "Made backup of ~/Documents."
rsync -a yanndebruyn@yanndebruyn.com:~/Documents/ ~/Documents/ 
echo "Finished rsyncing Documents from Dreamhost to localhost."

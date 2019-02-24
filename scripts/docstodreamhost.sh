#!/bin/bash
cp -r ~/Documents/* ~/Documents_backup/
echo "Made backup of ~/Documents."
rsync -a ~/Documents/ yanndebruyn@yanndebruyn.com:~/Documents/ 
echo "Finished rsyncing Documents from localhost to Dreamhost."

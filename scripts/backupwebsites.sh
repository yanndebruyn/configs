#!/bin/bash


echo "Starting backup of websites."

# run dreamhostscript.sh on Dreamhost server through SSH
# This will backup all wordpress databases and archive the website directories

ssh yanndebruyn@yanndebruyn.com 'bash -s' < dreamhostscript.sh 
echo "Finished MySQL dumps and website archives on Dreamhost."



# Rsync command to copy backups from dreamhost server to laptop

echo "Starting rsync from Dreamhost to localhost"
rsync -a yanndebruyn@yanndebruyn.com:~/website_backups ~/webdev_local/ 
echo "Finished syncing website and database backups to localhost."



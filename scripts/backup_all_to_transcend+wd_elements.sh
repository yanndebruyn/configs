#!/bin/bash


echo -e "\n\n\n>>>>> $(date +%d-%m-%y__%T) <<<<<\n>>>>> Starting automated backup. <<<<<" >> ~/.backuplog

# run dreamhostscript.sh on Dreamhost server through SSH
# This will backup all wordpress databases and archive the website directories

echo -e "\n   ***** Starting dreamhostscript.sh ... *****" >> ~/.backuplog
ssh yanndebruyn@yanndebruyn.com 'bash -s' < dreamhostscript.sh >> ~/.backuplog 2>&1
echo "   ***** Finished MySQL dumps and website archives on Dreamhost. *****" >> ~/.backuplog



# Rsync command to copy backups from dreamhost server to laptop

echo "   ***** Starting rsync from Dreamhost to localhost ... *****" >> ~/.backuplog
rsync -a yanndebruyn@yanndebruyn.com:~/website_backups ~/webdev_local/ >> ~/.backuplog 2>&1 ~/.backuplog
echo "   ***** Finished syncing website and database backups to localhost. *****" >> ~/.backuplog



# Commands to backup home directories on laptop to hd's

echo -e "\n      ***** Starting backup of home directories to USB HD's *****" >> ~/.backuplog
echo -e "\n      ***** Mounting external drives... *****" >> ~/.backuplog

sudo -S mkdir /media/yann/TRANSCEND /media/yann/wd_elements >> ~/.backuplog 2>&1

sudo mount /dev/sdb1 /media/yann/wd_elements >> ~/.backuplog 2>&1
sudo mount /dev/sdc1 /media/yann/TRANSCEND >> ~/.backuplog 2>&1

echo -e "      ***** Mounting done. *****" >> ~/.backuplog

sudo rsync -a /home/ /media/yann/wd_elements/home/ >> ~/.backuplog 2>&1

echo -e "      ***** Finished backup to wd_elements. *****" >> ~/.backuplog

sudo rsync -a /home/ /media/yann/TRANSCEND/home/ >> ~/.backuplog 2>&1

echo -e "      ***** Finished backup to TRANSCEND. *****" >> ~/.backuplog

echo -e "\n   ***** Finished backup of home directories. *****" >> ~/.backuplog
echo -e "\n>>>>> Finished backupscript at $(date +%T) <<<<<" >> ~/.backuplog

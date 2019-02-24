#!/bin/bash


echo -e "\n\n\n>>>>> $(date +%d-%m-%y__%T) <<<<<\n>>>>> Starting automated backup. <<<<<" >> ~/.backuplog

# run dreamhostscript.sh on Dreamhost server through SSH
# This will backup all wordpress databases and archive the website directories

echo -e "\n   ***** Starting dreamhostscript.sh ... *****" >> ~/.backuplog
ssh yanndebruyn@yanndebruyn.com 'bash -s' < dreamhostscript.sh 1>> ~/.backuplog 2>> ~/.backuplog
echo "   ***** Finished MySQL dumps and website archives on Dreamhost. *****" >> ~/.backuplog



# Rsync command to copy backups from dreamhost server to laptop

echo "   ***** Starting rsync from Dreamhost to localhost ... *****" >> ~/.backuplog
rsync -a yanndebruyn@yanndebruyn.com:~/website_backups ~/webdev_local/ 1>> ~/.backuplog 2>> ~/.backuplog
echo "   ***** Finished syncing website and database backups to localhost. *****" >> ~/.backuplog



# Commands to backup home directories on laptop to hd's

echo -e "\n      ***** Starting backup of home directories to USB HD's *****" >> ~/.backuplog
echo -e "\n      ***** Mounting external drives... *****" >> ~/.backuplog

echo "Ya19De80Br" | sudo -S mkdir /media/yann/Seagate\ 3TB\ backup\ 1 /media/yann/Seagate\ 3TB\ backup\ 2 2>> ~/.backuplog
echo "Ya19De80Br" | sudo mount /dev/sdc2 /media/yann/Seagate\ 3TB\ backup\ 1 2>> ~/.backuplog
echo "Ya19De80Br" | sudo mount /dev/sdb2 /media/yann/Seagate\ 3TB\ backup\ 2 2>> ~/.backuplog

echo -e "      ***** Mounting done. *****" >> ~/.backuplog

echo "Ya19De80Br" | sudo rsync -a /home/ /media/yann/Seagate\ 3TB\ backup\ 1/home/ 1>> ~/.backuplog 2>> ~/.backuplog

echo -e "      ***** Finished backup to Seagate 1. *****" >> ~/.backuplog

echo "Ya19De80Br" | sudo rsync -a /home/ /media/yann/Seagate\ 3TB\ backup\ 2/home/ 1>> ~/.backuplog 2>> ~/.backuplog

echo -e "      ***** Finished backup to Seagate 2. *****" >> ~/.backuplog

echo -e "\n   ***** Finished backup of home directories. *****" >> ~/.backuplog
echo -e "\n>>>>> Finished backupscript at $(date +%T) <<<<<" >> ~/.backuplog

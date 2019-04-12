#!/bin/bash


echo -e "\n\n\n>>>>> $(date +%d-%m-%y__%T) <<<<<\n>>>>> Starting automated backup. <<<<<" >> ~/.backuplog

# run dreamhostscript.sh on Dreamhost server through SSH
# This will backup all wordpress databases and archive the website directories

echo -e "\n   ***** Starting dreamhostscript.sh ... *****" >> ~/.backuplog
ssh yanndebruyn@yanndebruyn.com 'bash -s' < /home/yann/scripts/dreamhostscript.sh >> ~/.backuplog 2>&1
echo "   ***** Finished MySQL dumps and website archives on Dreamhost. *****" >> ~/.backuplog



# Rsync command to copy backups from dreamhost server to laptop

echo "   ***** Starting rsync from Dreamhost to localhost ... *****" >> ~/.backuplog
rsync -a yanndebruyn@yanndebruyn.com:~/website_backups ~/webdev_local/ >> ~/.backuplog 2>&1 ~/.backuplog
echo "   ***** Finished syncing website and database backups to localhost. *****" >> ~/.backuplog



# Commands to backup home directories on laptop to hd's
echo -e "\n      ***** Starting backup of home directories to USB HD's *****" >> ~/.backuplog
echo -e "\n      ***** Mounting external drives... *****" >> ~/.backuplog


# If mount point don't exist yet, then create them
if [ ! -d /media/yann/TRANSCEND ]; then
	sudo -S mkdir -p /media/yann/TRANSCEND >> ~/.backuplog 2>&1
fi 
if [ ! -d /media/yann/wd_elements ]; then
	sudo -S mkdir -p /media/yann/wd_elements >> ~/.backuplog 2>&1
fi
 

# If drives are not already mounted, then mount them
if [ ! grep -qs '/media/yann/wd_elements' /proc/mounts ]; then
	sudo mount /dev/sdb1 /media/yann/wd_elements >> ~/.backuplog 2>&1
fi

if [ ! grep -qs '/media/yann/TRANSCEND' /proc/mounts ]; then
	sudo mount /dev/sdc1 /media/yann/TRANSCEND >> ~/.backuplog 2>&1
fi

echo -e "      ***** Mounting done. *****" >> ~/.backuplog


if [ -d /media/yann/wd_elements ]; then
	echo -e "      ***** Starting backup of /home to wd_elements. *****" >> ~/.backuplog
	sudo rsync -rltu /home/yann /media/yann/wd_elements/home/ >> ~/.backuplog 2>&1
	echo -e "      ***** Finished backup to wd_elements. *****" >> ~/.backuplog
else
	echo -e "      ***** wd_elements is not mounted, no backup made. *****" >> ~/.backuplog
fi

if [ -d /media/yann/TRANSCEND ]; then
	echo -e "      ***** Starting backup of /home to TRANSCEND. *****" >> ~/.backuplog
	sudo rsync -rltu /home/yann /media/yann/TRANSCEND/home >> ~/.backuplog 2>&1
	echo -e "      ***** Finished backup to TRANSCEND. *****" >> ~/.backuplog
else
	echo -e "      ***** TRANSCEND is not mounted, no backup made. *****" >> ~/.backuplog
fi

echo -e "\n   ***** Finished backup of home directories. *****" >> ~/.backuplog
echo -e "\n>>>>> Finished backupscript at $(date +%T) <<<<<\n\n\n" >> ~/.backuplog

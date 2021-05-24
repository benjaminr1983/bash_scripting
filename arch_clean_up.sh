#!/bin/bash
# script_name:arch_clean_up
# script_version: 0.1
# script_author: Benjamin Reinicke
# script_date: 14.05.2021
# script_license: GPL-2.0

# variable
user_name=$1		
# clean_up orphans
sudo pacman -Rns $(pacman -Qtdq)

# check the user_cache
sudo du -sh ~/.cache/

sudo rm -r ~/.cache/

# clear the user cache
rmlint /home/$user_name
echo 'Please, check the files for any file that is not supposed to be deleted and remove it from the script!'
./rmlint.sh -d

# clean the journal
sudo journalctl --vacuum-time=2weeks

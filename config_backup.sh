#!/bin/bash
#--------------------------------------------------------------------------------------------------------------------------------------------#
# script_name: config_backup.sh
# script_version: 0.1
# script_author: Benjamin Reinicke
# script_date: ..2021
# script_license: GPL-2.0
#--------------------------------------------------------------------------------------------------------------------------------------------#
for f in $HOME/.bash*
    do 
        cp "$f" "$HOME/git_hub_projects/05_config_files/bash"
    done



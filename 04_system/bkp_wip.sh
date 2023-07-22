#!/bin/bash
#------------------------------------------------------------------------------------------------------------------------------------#
# script_name: backup_script.sh 
# script_version: 0.1
# script_author: Benjamin Reinicke
# script_date: 14.11.2021
# script_license: GPL-2.0
#------------------------------------------------------------------------------------------------------------------------------------#
# variables
source_dir="$HOME/vm/backups/$(date +%F)"
log_file="$HOME/log/backup.log"
# create folder
mkdir -p $source_dir/{documents,it_books,it_guide,pictures,videos}
# rsync folder
rsync -aP --delete --log-file=$log_file "$HOME/Documents"/ $source_dir/documents
rsync -aP --delete --log-file=$log_file "$HOME/it_books"/ $source_dir/it_books
rsync -aP --delete --log-file=$log_file "$HOME/it_guide"/ $source_dir/it_guide
rsync -aP --delete --log-file=$log_file "$HOME/Pictures"/ $source_dir/pictures 
rsync -aP --delete --log-file=$log_file "$HOME/Videos"/ $source_dir/videos

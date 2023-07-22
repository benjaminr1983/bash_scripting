#!/bin/bash
#--------------------------------------------------------------------------------------------------------------------------------------------#
# script_name: renaming_script
# script_version: 0.1
# script_author: Benjamin Reinicke
# script_date: 09.10.2021
# script_license: GPL-2.0
#--------------------------------------------------------------------------------------------------------------------------------------------#
# do not print the current directories by pushd/popd
pushd () {
    command pushd "$@" > /dev/null 
}
popd () {
    command popd "$@" > /dev/null
}
# predefined variables
a=1
# requested variables
printf "Please be aware that the numbering will ontly be happening in a range of 1 - 99.\n"
read -p "Please enter the directory where the files are located: " dir 
pushd "$HOME"/$dir
# determine the filetype
read -p "Please enter the filetype: " file_type 
# determing the naming convention
read -p "Please enter if there should be a string (b)efore the numbering, (a)fter the numbering or if there (n)eedn't be any string: " loc
if [[ $loc = [Aa] ]] || [[ $loc = [Bb] ]]
    then  read -p "Please enter the naming convention: " cnv
fi
# process of renaming
case $loc in
    [Bb]*)      for i in *.$file_type;
                do
                new=$(printf "%02d.$file_type" "$a")
                mv -i -- "$i" $cnv"$new"
                let a=a+1
                done;;
    [Aa]*)      for i in *.$file_type;
                do
                new=$(printf "%02d" "$a")
                mv -i -- "$i" "$new"$cnv.$file_type 
                let a=a+1;
                done;;
    [Nn]*)      for i in *.$file_type;
                do
                new=$(printf "%02d.$file_type" "$a") 
                mv -i -- "$i" "$new"
                let a=a+1;
                done;;
    *)          printf "You have entered an invalid variable please only use A,a,B,b,N,n."
esac
popd

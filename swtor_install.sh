#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
# script_name: install_sript swtor
# script_version: 0.1
# script_author: Benjamin Reinicke
# script_date: 23.09.2021
# script_license: GPL-2.0
#----------------------------------------------------------------------------------------------------------------------#
# variables
# request the distro
echo
read -p "please choose th distro you are using:
    [A]rch-based
    [D]ebian-based
    [R]ed Hat-based 
    [S]use-based 
       Distribution:   " adrs && echo
# install wine, lutris, teamspeak
case $adrs in
# arch
[Aa]* ) yes | sudo pacman -Syu wine-staging winetricks wine-mono wine_gecko vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d gvfs lutris teamspeak3;;
# debian
[Dd]* ) yes | sudo apt update && sudo apt upgrade;
        yes | sudo apt install wine-staging winetricks wine-mono wine_gecko vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d gvfs lutris teamspeak3;;
# red hat
[Rr]* ) yes | sudo dnf upgrade --refresh;
        yes | sudo dnf wine-staging winetricks wine-mono wine_gecko vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d gvfs lutris teamspeak3;;
# suse
[Ss]* ) yes | sudo zypper update;
        yes | sudo zypper wine-staging winetricks wine-mono wine_gecko vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d gvfs lutris teamspeak3;;
esac
# download certificate

# certificates that are currently not supported by wine must be added and trusted now
# here it is described for arch_linux
# download the certificates
#https://www.thawte.com/roots/thawte_Primary_Root_CA.pem
#https://symantec.tbs-certificats.com/pca3-g5ss.crt

# they will be downloaded in the ~/Download folder
# this must be done as root
# the thawte certificate must be renamed to *.crt
#sudo mv thawte_Primary_Root_CA.pem thawte_Primary_Root_CA.crt

# the certificates must be trusted now
#sudo trust anchor --store pca3-g5ss.crt thawte_Primary_Root_CA.crt


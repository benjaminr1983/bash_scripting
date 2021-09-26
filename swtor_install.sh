#!/bin/bash
# script_name: install_sript swtor
# script_version: 0.1
# script_author: Benjamin Reinicke
# script_date: 23.09.2021
# script_license: GPL-2.0

# install wine_dependencies
yay -Syu wine-staging winetricks wine-mono wine_gecko vulkan-icd-loader lib32-ulkan-icd-loader vkd3d lib32-vkd3d gvfs

# install lutris
yay -S lutris teamspeak3

# certificates that are currently not supported by wine must be added and trusted now
# here it is described for arch_linux
# download the certificates
https://www.thawte.com/roots/thawte_Primary_Root_CA.pem
https://symantec.tbs-certificats.com/pca3-g5ss.crt

# they will be downloaded in the ~/Download folder
# this must be done as root
# the thawte certificate must be renamed to *.crt
sudo mv thawte_Primary_Root_CA.pem thawte_Primary_Root_CA.crt

# the certificates must be trusted now
sudo trust anchor --store pca3-g5ss.crt thawte_Primary_Root_CA.crt


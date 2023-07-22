#!/bin/bash
#---------------------------------------------------------------------------------------------------------------#
# script_name:arch_install 
# script_version: 0.1
# script_author: Benjamin Reinicke
# script_date: 26.10.2022
# script_license: GPL-2.0
#---------------------------------------------------------------------------------------------------------------#
# variables
read -p "Please, enter your microcode (Ii) for Intel and (Aa) for AMD:   " mcode
# functions

# prepare image-creation
sed -i 's/MODULES=()/MODULES=(btrfs)/' /etc/mkinitcpio.conf
sed -i 's/block filesystems/block encrypt filesystems/' /etc/mkinitcpio.conf
mkinitcpio -p linux



# install basic packages
pacman -S --noconfirm base-devel dialog sudo dosfstools efibootmgr os-prober mtools avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion rsync acpi acpi_call tlp virt-manager qemu qemu-arch-extra edk2-ovmf vde2 firewalld sof-firmware nss-mdns acpid xdotool wmctrl reflector

# install network packages
pacman -S --noconfirm openssh networkmanager wpa_supplicant wireless_tools netctl network-manager-applet inetutils dnsutils dnsmasq bridge-utils openbsd-netcat ipset iptables-nft ntfs-3g

# install fonts
pacman -S --noconfirm terminus-font powerline-fonts ttf-font-awesome noto-fonts

# amd
pacman -S --noconfirm amd-ucode xf86-amdgpu
# intel
pacman -S --noconfirm intel-ucode 
# start the services
systemctl enable NetworkManager # Network service
systemctl enable bluetooth # bluetooth service
systemctl enable cups.service # printer management
systemctl enable sshd # security management
systemctl enable avahi-daemon # network service discovery
systemctl enable tlp # energy management
systemctl enable reflector.timer # automatic pacman patching
systemctl enable fstrim.timer # storage management
systemctl enable libvirtd # vm management
systemctl enable firewalld # firewall management
systemctl enable acpid # advanced power management


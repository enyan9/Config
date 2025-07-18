#!/bin/bash

#sudo hostnamectl set-hostname 'localhost-XYZ'
#sudo btrfs filesystem label / 'localhost-XYZ'

### GUIs and other clients

#https://rpmfusion.org/Howto/Multimedia
sudo dnf install ffmpeg --allowerasing

sudo dnf install -y \
    flatpak age vlc VirtualBox remmina yakuake firefox thunderbird wireshark \
    postgresql kate lm_sensors
    
# #https://docs.fedoraproject.org/en-US/quick-docs/virtualization-getting-started/
# sudo dnf group install --with-optional virtualization
# sudo systemctl enable --now libvirtd

wget 'https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64' \
    -O "$HOME"/app/Zotero-latest_linux-x86_64.tar.bz2

sudo dnf config-manager setopt google-chrome.enabled=1 && sudo dnf install -y google-chrome-stable
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc \
    && sudo dnf config-manager addrepo https://packages.microsoft.com/yumrepos/edge \
    && sudo dnf config-manager addrepo https://packages.microsoft.com/yumrepos/vscode \
    && sudo dnf install -y microsoft-edge-stable code

# wget https://downloads.vivaldi.com/stable/vivaldi-stable-6.4.3160.42-1.x86_64.rpm && sudo dnf --nogpgcheck -y install ./vivaldi*.rpm

### Office productivity
sudo dnf install -y \
    hplip ifuse gimp \
    livecd-tools libheif-freeworld

# gimp-heif-plugin calibre # heif-pixbuf-loader #libheif-freeworld 
# x2goserver x2goclient # x2goserver-xsession 


### Heavy-duty productivity
# sudo dnf install -y \
#     steam blender

#https://old.reddit.com/r/Fedora/comments/zpnwuk/problems_installing_ffmpeg_in_fedora_37/
# sudo dnf install --allowerasing ffmpeg-devel

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.obsproject.Studio
# flatpak install flathub com.discordapp.Discord/x86_64/stable

# install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# flatpak run com.obsproject.Studio

#Apparently these will cause the script to exit, so they need to be at the end?
sudo usermod -G vboxusers -a "$USER"
newgrp vboxusers #or relog/restart 
#VirtualBox    
#VBoxManage list vms
#https://download.virtualbox.org/virtualbox/7.0.4/VBoxGuestAdditions_7.0.4.iso

# sudo modprobe -r kvm_amd kvm 
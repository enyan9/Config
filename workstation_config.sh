#!/bin/bash

#sudo hostnamectl set-hostname 'localhost-XYZ'
#sudo btrfs filesystem label / 'localhost-XYZ'

### GUIs and other clients

#https://rpmfusion.org/Howto/Multimedia
sudo dnf install ffmpeg --allowerasing

sudo dnf install -y \
    flatpak age vlc VirtualBox remmina yakuake firefox thunderbird wireshark \
    postgresql kate lm_sensors
    
sudo usermod -G vboxusers -a "$USER"
newgrp vboxusers #or relog/restart 
#VirtualBox    
#VBoxManage list vms
#https://download.virtualbox.org/virtualbox/7.0.4/VBoxGuestAdditions_7.0.4.iso

wget 'https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64' \
    -O "$HOME"/app/Zotero-latest_linux-x86_64.tar.bz2

sudo dnf config-manager --set-enabled google-chrome && sudo dnf install -y google-chrome-stable
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc \
    && sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge \
    && sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/vscode \
    && sudo dnf install -y microsoft-edge-stable

### Office productivity
sudo dnf install -y \
    hplip ifuse gimp \
    livecd-tools
    #gimp-heif-plugin calibre
    #x2goserver x2goclient # x2goserver-xsession 


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
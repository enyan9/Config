#!/bin/bash

sudo dnf install -y \
    flatpak age vlc VirtualBox remmina yakuake firefox thunderbird wireshark \
    postgresql kate
    
sudo usermod -G vboxusers -a "$USER"
newgrp vboxusers #or relog/restart 
#VirtualBox    
#VBoxManage list vms
#https://download.virtualbox.org/virtualbox/7.0.4/VBoxGuestAdditions_7.0.4.iso

sudo dnf install -y \
    hplip ifuse gimp gimp-heif-plugin \
    livecd-tools
    #x2goserver-xsession  calibre


# sudo dnf install -y \
#     steam blender

#https://old.reddit.com/r/Fedora/comments/zpnwuk/problems_installing_ffmpeg_in_fedora_37/
sudo dnf install --allowerasing ffmpeg-devel

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.obsproject.Studio
# flatpak run com.obsproject.Studio

wget https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64 -P "$HOME"/app
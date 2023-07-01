#!/bin/bash

sudo dnf install -y \
    flatpak age vlc VirtualBox remmina yakuake firefox thunderbird wireshark \
    nfs-utils
    
sudo usermod -G vboxusers -a "$USER"
newgrp vboxusers #or relog/restart 
#VirtualBox    
#VBoxManage list vms
#https://download.virtualbox.org/virtualbox/7.0.4/VBoxGuestAdditions_7.0.4.iso

sudo dnf install -y \
    hplip ifuse gimp gimp-heif-plugin
    #x2goserver-xsession  calibre


# sudo dnf install -y \
#     steam blender

#https://old.reddit.com/r/Fedora/comments/zpnwuk/problems_installing_ffmpeg_in_fedora_37/
sudo dnf install --allowerasing ffmpeg-devel 
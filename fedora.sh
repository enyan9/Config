#!/bin/bash

# sudo usermod -G vboxsf -a $USER

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y fedora-workstation-repositories

sudo dnf install -y \
    which wget zsh tmux git git-lfs ranger jq openssh nfs-utils btop sshfs zip

# https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/infrastructure-services/OpenSSH/
# sudo systemctl enable sshd.service

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P "$HOME" \
    && chmod 755 "$HOME"/Miniconda3-latest-Linux-x86_64.sh \
    && "$HOME"/Miniconda3-latest-Linux-x86_64.sh -b -p "$HOME"/miniconda3 \
    && "$HOME"/miniconda3/bin/conda init bash zsh
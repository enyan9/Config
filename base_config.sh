#!/bin/bash

HOM=${1:-"$HOME"}
read -p "Enter github username: " git_name

#sudo hostnamectl set-hostname HOSTNAME

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y fedora-workstation-repositories

sudo dnf install -y \
    which wget zsh tmux git git-lfs ranger jq openssh nfs-utils btop sshfs zip

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P "$HOM" \
    && chmod 755 "$HOM"/Miniconda3-latest-Linux-x86_64.sh \
    && "$HOM"/Miniconda3-latest-Linux-x86_64.sh -b -p "$HOM"/miniconda3 \
    && "$HOM"/miniconda3/bin/conda init bash zsh

cp -r --backup=simple linux/FedoraSpin/38/kde/Arc/. "$HOM"
cp -r --backup=simple linux/FedoraSpin/38/kde/SeibaMorgan/. "$HOM"
cp -r --backup=simple linux/dotfiles/. "$HOM"
cp -r --backup=simple linux/FedoraSpin/38/kde/Konsole/. "$HOM"

chsh -s $(which zsh)

git config --global core.excludesfile ~/.gitignore
git config --global user.name "$git_name" && git config --global user.email "noreply@github.com"

sudo dnf install -y yakuake kate

cp -r --backup=simple linux/FedoraSpin/38/kde/Yakuake/. "$HOM"


sudo dnf config-manager --set-enabled google-chrome && sudo dnf install -y google-chrome-stable

sudo dnf install -y \
    podman qemu fuse-overlayfs \
    x2goserver x2goclient 




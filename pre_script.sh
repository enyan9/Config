#!/bin/bash

HOM=${1:-"$HOME"}

# sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# sudo dnf install fedora-workstation-repositories

# sudo dnf install -y \
#     which wget zsh tmux git git-lfs ranger jq openssh nfs-utils btop sshfs zip

#https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/infrastructure-services/OpenSSH/
#sudo systemctl enable sshd.service

cp -r --backup=simple linux/FedoraSpin/38/kde/Arc/. "$HOM"
cp -r --backup=simple linux/FedoraSpin/38/kde/SeibaMorgan/. "$HOM"
cp -r --backup=simple linux/dotfiles/. "$HOM"

chsh -s $(which zsh)

git config --global core.excludesfile ~/.gitignore
git config --global user.name "enyan9" && git config --global user.email "noreply@github.com"
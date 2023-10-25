#!/bin/bash

# Barebones skin configuration without 3rd-party distro application packages to get going.

read -p "Enter github username: " git_name

# sudo usermod -G vboxsf -a $USER
# For VM testing see: https://askubuntu.com/questions/198452/no-host-only-adapter-selected

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y fedora-workstation-repositories

sudo dnf install -y \
    which wget zsh tmux vim git git-lfs ranger jq openssh nfs-utils procps btop sshfs zip rsync rclone

# https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/infrastructure-services/OpenSSH/
# sudo systemctl enable sshd.service

cp -r --backup=simple linux/FedoraSpin/38/kde/Arc/. "$HOME"
cp -r --backup=simple linux/FedoraSpin/38/kde/SeibaMorgan/. "$HOME"
cp -r --backup=simple linux/dotfiles/. "$HOME"
cp -r --backup=simple linux/FedoraSpin/38/kde/Konsole/. "$HOME"

chsh -s $(which zsh)

git config --global core.excludesfile ~/.gitignore
git config --global user.name "$git_name" && git config --global user.email "noreply@github.com"

sudo dnf install -y yakuake kate

cp -r --backup=simple linux/FedoraSpin/38/kde/Yakuake/. "$HOME"

# sudo fwupdmgr get-devices

## Miniconda

read -p 'Install miniconda? (yes/Y) ' miniconda_install

# Convert the answer to lowercase for case-insensitive comparison
miniconda_install="${miniconda_install,,}"

if [[ "$miniconda_install" == "yes" || "$miniconda_install" == "y" ]]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P "$HOME" \
        && chmod 755 "$HOME"/Miniconda3-latest-Linux-x86_64.sh \
        && "$HOME"/Miniconda3-latest-Linux-x86_64.sh -b -p "$HOME"/miniconda3 \
        && "$HOME"/miniconda3/bin/conda init bash zsh
fi
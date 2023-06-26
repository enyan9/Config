#!/bin/bash

HOM=${1:-"$HOME"}

#sudo usermod -G vboxsf -a $USER

cp -r --backup=simple linux/FedoraSpin/38/kde/Arc/. "$HOM"
cp -r --backup=simple linux/FedoraSpin/38/kde/SeibaMorgan/. "$HOM"
cp -r --backup=simple linux/dotfiles/. "$HOM"
cp -r --backup=simple linux/FedoraSpin/38/kde/Konsole/. "$HOM"

chsh -s $(which zsh)

git config --global core.excludesfile ~/.gitignore
git config --global user.name "enyan9" && git config --global user.email "noreply@github.com"

sudo dnf install -y yakuake kate

cp -r --backup=simple linux/FedoraSpin/38/kde/Yakuake/. "$HOM"

# sudo dnf config-manager --set-enabled google-chrome && sudo dnf install -y google-chrome-stable
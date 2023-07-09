#!/bin/bash

read -p "Enter remote path: " remote_path

# List of directories to backup
backup_directories=(
    "$HOME/Zotero"
    "$HOME/vm"
)

for dir in "${backup_directories[@]}"; do

    rsync -av --progress  "$dir" "$remote_path"
done
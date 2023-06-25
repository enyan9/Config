#!/bin/bash
#From WSL ./update_code_windows.sh /mnt/c/Users/$USER/app 

#https://code.visualstudio.com/docs/editor/portable
##https://code.visualstudio.com/docs/editor/command-line

#https://code.visualstudio.com/sha/download?build=stable&os=linux-x64
#https://update.code.visualstudio.com/latest/linux-x64/stable

ROOT_DIR=${1:-"/mnt/c/Users/""$USER"}
VERSION=${2:-"latest"}

ZIP="VSCode-win32-x64-${VERSION}.zip"
ZIPX="VSCode-win32-x64-${VERSION}"

wget "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive" -O "${ROOT_DIR}/${ZIP}"
unzip "${ROOT_DIR}/${ZIP}" -d "${ROOT_DIR}/${ZIPX}"

for app in 'base' 'notebook' 'paint' 'pdf' 'repo' 'terminal', 'aux'; do
    echo "${ROOT_DIR}/vscode-${app}/"

    rsync -av "${ROOT_DIR}/${ZIPX}/" "${ROOT_DIR}/vscode-${app}/"

    mkdir -p "${ROOT_DIR}vscode-${app}/data"
    sed -i 's/"win32AppUserModelId": "Microsoft.VisualStudioCode"/"win32AppUserModelId": "vscode-'"$app"'"/' "$ROOT_DIR""/vscode-""$app""/resources/app/product.json"
done
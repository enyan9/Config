 #!/bin/bash
 #./update_code.sh ~/app 

#https://code.visualstudio.com/docs/editor/portable
##https://code.visualstudio.com/docs/editor/command-line

#https://code.visualstudio.com/sha/download?build=stable&os=linux-x64
#https://update.code.visualstudio.com/latest/linux-x64/stable

ROOT_DIR=${1:-"/home/$USER/app/vscode"}
VERSION=${2:-"latest"}

TAR="VSCode-linux-x64-${VERSION}.tar.gz"
TARX="VSCode-linux-x64"

mkdir -p "$ROOT_DIR"

wget "https://update.code.visualstudio.com/${VERSION}/linux-x64/stable" -O "${ROOT_DIR}/${TAR}"
tar -xf "${ROOT_DIR}/${TAR}" --directory "${ROOT_DIR}"

for app in 'base' 'notebook' 'paint' 'pdf' 'repo' 'terminal' 'aux'; do
    echo "${ROOT_DIR}/vscode-${app}"
    rsync -av "${ROOT_DIR}/${TARX}/" "${ROOT_DIR}/vscode-${app}"
    mkdir -p "${ROOT_DIR}/vscode-${app}/data"

    sed -i 's/"name": "Code"/"name": "vscode-'"$app"'"/' "${ROOT_DIR}/vscode-${app}/resources/app/package.json"
done
#!/bin/bash

### Additional packages for bare-metal nodes

sudo dnf install -y \
    podman qemu fuse-overlayfs \
    nfs-utils

sudo dnf config-manager setopt google-chrome.enabled=1 && sudo dnf install -y google-chrome-stable
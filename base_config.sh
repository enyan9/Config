#!/bin/bash

sudo dnf config-manager --set-enabled google-chrome && sudo dnf install -y google-chrome-stable

### Additional packages for bare-metal nodes

sudo dnf install -y \
    podman qemu fuse-overlayfs \
    nfs-utils
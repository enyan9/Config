#!/bin/bash

./fedora.sh

sudo dnf config-manager --set-enabled google-chrome && sudo dnf install -y google-chrome-stable

sudo dnf install -y \
    podman qemu fuse-overlayfs \
    nfs-utils 
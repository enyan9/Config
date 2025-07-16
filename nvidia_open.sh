#!/bin/bash

# https://docs.nvidia.com/datacenter/tesla/driver-installation-guide/index.html#fedora

# sudo dnf config-manager addrepo --from-repofile=https://developer.download.nvidia.com/compute/cuda/repos/fedora41/x86_64/cuda-fedora41.repo
sudo dnf config-manager addrepo --from-repofile=https://developer.download.nvidia.com/compute/cuda/repos/fedora$(rpm -E %fedora)/x86_64/cuda-fedora$(rpm -E %fedora).repo


sudo dnf install -y nvidia-open

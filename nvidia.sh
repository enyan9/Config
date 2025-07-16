#!/bin/bash

## https://rpmfusion.org/Howto/NVIDIA
sudo dnf --enablerepo=rpmfusion-nonfree --enablerepo=rpmfusion-free install -y akmod-nvidia xorg-x11-drv-nvidia-cuda
## CUDA libs for ffmpeg: xorg-x11-drv-nvidia-cuda-libs

# nvidia-smi
# modinfo -F version nvidia

## https://rpmfusion.org/Howto/NVIDIA#Suspend

# sudo dnf install xorg-x11-drv-nvidia-power
# sudo systemctl enable nvidia-{suspend,resume,hibernate}

# Troubleshooting:
# https://discussion.fedoraproject.org/t/nvidia-driver/64653/9


## https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-with-yum-or-dnf
## https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/cdi-support.html

curl -s -L https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo | \
  sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo && sudo dnf install -y nvidia-container-toolkit

sudo nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml

nvidia-ctk cdi list

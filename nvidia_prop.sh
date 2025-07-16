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

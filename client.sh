#!/bin/bash


read -p "Enter server hostname: " host_name

read -p "Enter NFS share name: " nfs_name

echo "$host_name:/$nfs_name   /mnt/$nfs_name  nfs4  _netdev,x-systemd.automount,x-systemd.mount-timeout=10,timeo=14,x-systemd.idle-timeout=1min 0 0" | sudo tee -a /etc/fstab \
    && sudo mkdir -p /mnt/"$nfs_name" \
    && sudo mount -a

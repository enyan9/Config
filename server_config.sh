#!/bin/bash

#SCIPRT IN TESTING

# https://docs.saltproject.io/en/3004/topics/installation/fedora.html
# sudo dnf install -y salt-minion

# sudo cp --backup etc/ssh/ssh_host* /etc/ssh/
sudo systemctl --now enable sshd.service

read -p "Enter service account username: " service_name

sudo useradd -m -s /usr/bin/zsh "$service_name" \
    && sudo cp -r --backup=simple linux/dotfiles/. /home/"$service_name"/ \
    && sudo chown -R "$service_name":"$service_name" /home/"$service_name" \
    && sudo passwd "$service_name"

read -p "Enter guest account username: " guest_name

sudo useradd -m -s /usr/bin/zsh "$guest_name" \
    && sudo cp -r --backup=simple linux/dotfiles/. /home/"$guest_name"/ \
    && sudo chown -R "$guest_name":"$guest_name" /home/"$guest_name" \
    && sudo passwd "$guest_name"

#########################
## Samba server config
## https://docs.fedoraproject.org/en-US/quick-docs/samba/

sudo dnf install -y samba
sudo mkdir -p /home/"$service_name"/sambashare \
    && sudo chown -R "$service_name":"$service_name" /home/"$service_name"/sambashare \
    && sudo tee -a /etc/samba/smb.conf > /dev/null << EOF 

[sambashare]
        comment = Samba on localhost
        path = /home/$service_name/sambashare
        read only = no
        browsable = yes
EOF

echo "Enter SMB password for $service_name" && sudo smbpasswd -a "$service_name"
sudo semanage fcontext --add --type "samba_share_t" "/home/$service_name/sambashare(/.*)?"
sudo restorecon -R /home/"$service_name"/sambashare 

# may or may not need "nmb" as well, depending on backwards compatibility
sudo systemctl --now enable smb 
smbclient -L //localhost --password=''

sudo firewall-cmd --permanent --add-service=samba --zone=FedoraWorkstation && sudo firewall-cmd --reload
sudo firewall-cmd --list-all

# dolphin smb://HOSTNAME
# windows \\HOSTNAME\sambashare

#########################
## NFS server config

lsblk --fs

read -p "Enter drive UUID: " uuid

# windows  \\192.168.0.X\srv\nfs\ak
# 192.168.0.X hostname  # C:\Windows\System32\drivers\etc\hosts

read -p "Enter NFS server name to configure for this drive: " nfs_name

sudo mkdir -p /srv/nfs/"$nfs_name" \
    && sudo chown nobody: /srv/nfs \
    && echo "UUID=$uuid  /mnt/$nfs_name     btrfs   defaults 0 2" | sudo tee -a /etc/fstab \
    && echo /mnt/"$nfs_name" /srv/nfs/"$nfs_name" none defaults,bind 0 0 | sudo tee -a /etc/fstab \
    && sudo mkdir -p /mnt/"$nfs_name" && sudo mount -a

sudo tee -a /etc/exports > /dev/null << EOF
/srv/nfs        192.168.0.0/24(rw,sync,no_subtree_check,fsid=0)
/srv/nfs/$nfs_name 192.168.0.0/24(rw,sync,nohide,no_subtree_check)
/srv/nfs/$nfs_name 127.0.0.1(rw,sync,nohide,no_subtree_check)
EOF

#--add-service=mountd
sudo firewall-cmd --permanent --add-service=nfs --add-service=rpc-bind --zone=FedoraWorkstation && sudo firewall-cmd --reload
sudo firewall-cmd --list-all

sudo exportfs -rav && sudo systemctl --now enable nfs-server

showmount -e localhost

######
# 
sudo dnf install -y \
    postgresql-server postgresql-contrib
#!/bin/bash

# Check if nfs-common is installed
if ! dpkg -s nfs-common >/dev/null 2>&1; then
    echo "nfs-common is not installed."
    read -p "Do you want to install nfs-common? (y/n): " choice
    if [[ $choice == [Yy]* ]]; then
        sudo apt-get update
        sudo apt-get install -y nfs-common
    else
        echo "nfs-common is required for this script to run. Exiting."
        exit 1
    fi
fi

# Ask for NFS server address
read -p "Enter NFS Server address [192.168.68.133]: " server
server=${server:-192.168.68.133}

# List NFS mounts
echo "Available NFS mounts from $server:"
mapfile -t mounts < <(showmount -e "$server" | awk 'NR>1 {print NR-1 ". " $1}')

# Check if any mounts are available
if [ ${#mounts[@]} -eq 0 ]; then
    echo "No NFS exports found on the server."
    exit 1
fi

# Display mounts and ask user to choose one
for mount in "${mounts[@]}"; do
    echo "$mount"
done
read -p "Enter the number to select the NFS directory to mount: " mount_choice
mount_point=$(echo ${mounts[mount_choice-1]} | awk '{print $2}')

# Extract the last part of the NFS directory path
nfs_dir_name=$(basename "$mount_point")

# Set the default local mount point
default_mount_point="/mnt/unraid/$nfs_dir_name"

# Ask for local mount point
read -p "Enter the local mount point [$default_mount_point]: " local_mount
local_mount=${local_mount:-$default_mount_point}

# Create mount point directory if it doesn't exist
mkdir -p "$local_mount"

# Mounting
echo "Mounting $mount_point to $local_mount..."
sudo mount -t nfs "$server:$mount_point" "$local_mount"
echo "Mount successful."

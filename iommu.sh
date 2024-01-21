#!/bin/bash

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Add Proxmox repository
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" >> /etc/apt/sources.list

# Remove enterprise repository
rm -f /etc/apt/sources.list.d/pve-enterprise.list

# Update and upgrade the system
apt update && apt dist-upgrade -y

# Install necessary packages
apt install -y git build-essential dkms pve-headers mdevctl

# Modify /etc/kernel/cmdline to add specific parameters
sed -i '$s/$/ intel_iommu=on iommu=pt/' /etc/kernel/cmdline

# Update boot configuration
proxmox-boot-tool refresh

# Configure modules for VFIO
echo -e "vfio\nvfio_iommu_type1\nvfio_pci\nvfio_virqfd" >> /etc/modules
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

# Update initramfs
update-initramfs -u -k all

# Reboot the system
echo "System will reboot in 5 seconds..."
sleep 5
reboot

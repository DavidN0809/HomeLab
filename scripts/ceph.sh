#!/bin/bash

# Variables
CEPH_ADMIN_KEY="AQBz8YllITjQJRAAomL3671SquuPjg98GlwAuQ=="
MONITOR_IPS="192.168.68.135:6789,192.168.68.99:6789,192.168.68.127:6789"
MOUNT_POINT="/mnt/cephfs"
CEPH_SECRET_FILE="/etc/ceph/ceph.client.admin.keyring"

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
   echo "This script must be run as root" 
   exit 1
fi

# Install ceph-fuse
apt-get update
apt-get install -y ceph-fuse

# Create mount directory
mkdir -p "$MOUNT_POINT"
chmod 0755 "$MOUNT_POINT"

# Ensure /etc/ceph directory exists
mkdir -p /etc/ceph
chmod 0755 /etc/ceph

# Create Ceph keyring file
cat > "$CEPH_SECRET_FILE" <<EOF
[client.admin]
key = $CEPH_ADMIN_KEY
caps mds = "allow *"
caps mgr = "allow *"
caps mon = "allow *"
caps osd = "allow *"
EOF
chmod 0600 "$CEPH_SECRET_FILE"

# Gather the mount facts and Mount CephFS if not already mounted
MOUNTED=$(mount | grep "$MOUNT_POINT")
if [ -z "$MOUNTED" ]; then
    mount -t ceph "$MONITOR_IPS:/" "$MOUNT_POINT" -o name=admin,secretfile="$CEPH_SECRET_FILE",_netdev,noatime
fi

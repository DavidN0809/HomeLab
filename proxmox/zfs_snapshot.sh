#!/bin/bash

# Run the zfs-auto-snapshot command and capture its exit status
/usr/sbin/zfs-auto-snapshot -r --label=daily --keep=31 rpool
SNAPSHOT_STATUS=$?

# Define the mount point and the SMB share
MOUNT_POINT="/mnt/nas_backup"
SMB_SHARE="//192.168.68.133/Backup/Proxmox-zfs/"

# Check if the snapshot command succeeded
if [ $SNAPSHOT_STATUS -eq 0 ]; then

    # Check if the mount point directory exists, if not create it
    if [ ! -d $MOUNT_POINT ]; then
        echo "Creating mount point directory..."
         mkdir -p $MOUNT_POINT
    fi

    # Check if the NAS is mounted
    if ! mountpoint -q $MOUNT_POINT; then
        # If not, attempt to mount it
        echo "Mounting the NAS..."
         mount -t cifs $SMB_SHARE $MOUNT_POINT -o guest
    fi

    # Verify the mount was successful before proceeding
    if mountpoint -q $MOUNT_POINT; then
        # Perform the rsync
        echo "Starting rsync..."
        rsync -av /rpool/.zfs/snapshot/ $MOUNT_POINT  # Updated rsync command
        echo "rsync completed."
    else
        # Output an error message if the mount failed
        echo "Failed to mount the NAS. Aborting."
        exit 1
    fi

else
    # Output an error message if the snapshot command failed
    echo "Failed to create snapshot. Aborting."
    exit 1
fi

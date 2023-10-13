
#!/bin/bash
# Update /etc/hosts with the IP addresses and hostnames of your VMs
echo "192.168.68.80 gluster-node1
192.168.68.81 gluster-node2
192.168.68.82 gluster-node3" | sudo tee -a /etc/hosts

# Update system and install GlusterFS server
sudo apt-get update
sudo apt-get install -y glusterfs-server

# Probe other nodes from each node
for node in gluster-node1 gluster-node2 gluster-node3; do
    if [[ $(hostname) != $node ]]; then
        sudo gluster peer probe $node
    fi
done

# Wait for a moment to ensure that peer probing is completed
sleep 10

# Check peer status
sudo gluster peer status

# Create a directory for the GlusterFS brick on each node
sudo mkdir -p /gluster/appdata

# Only create and start the volume from one node
if [[ $(hostname) == "gluster-node1" ]]; then
    sudo gluster volume create dockers replica 3 \
        gluster-node1:/gluster/appdata \
        gluster-node2:/gluster/appdata \
        gluster-node3:/gluster/appdata force

    sudo gluster volume start dockers
fi

# Mount the GlusterFS volume on each node
sudo mkdir -p /mnt/glusterfs/dockers
sudo mount -t glusterfs gluster-node1:/dockers /mnt/glusterfs/dockers/
sudo chown -R $USER:$USER /mnt/glusterfs/dockers
echo "gluster-node1:/dockers /mnt/glusterfs/dockers glusterfs defaults,_netdev 0 0" | sudo t>

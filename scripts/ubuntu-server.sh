#!/bin/bash

# Install Kubernetes and Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# Install Kubevirt
echo "deb http://download.opensuse.org/repositories/Virtualization:/kubevirt:/stable:/v1.22/Ubuntu_20.04/ /" | sudo tee /etc/apt/sources.list.d/kubevirt.list
curl -fsSL https://download.opensuse.org/repositories/Virtualization:/kubevirt:/stable:/v1.22/Ubuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/kubevirt.gpg > /dev/null
sudo apt update
sudo apt install -y kubevirt

# Install GParted
sudo apt install -y gparted

# Install GlusterFS
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:gluster/glusterfs-7
sudo apt update
sudo apt install -y glusterfs-server

# Install Rancher
sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher


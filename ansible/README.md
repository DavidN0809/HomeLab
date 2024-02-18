# HomeLab
## Ansible Playbooks

The following Ansible playbooks are available:

- docker.yml: installs docker, adds to /etc/hosts, creates docker swarm
  Usage: `ansible-playbook -i inventory.ini ./playbooks/docker.yml`

- extend_ext4.yml: extend ext4 volume
  Usage: `ansible-playbook -i inventory.ini ./playbooks/extend_ext4.yml`
  
- install_curl.yml: installs curl
  Usage: `ansible-playbook -i inventory.ini ./playbooks/install_curl.yml`
  
- k3s-cephfs: installs cephfs and setups pv and pvc
  Usage: `ansible-playbook -i inventory.ini ./playbooks/k3s-cephfs.yml`

- mount-cephfs.yml: installs ceph client and connects to cluster, mounts in /mnt
  Usage: `ansible-playbook -i inventory.ini ./playbooks/mount-cephfs.yml` 

- mount_nfs.yml: mounts various nfs shares as guest from unRaid Box
  Usage: `ansible-playbook -i inventory.ini ./playbooks/mount_nfs.yml`

- proxmox-update.yml: updates proxmox
  Usage: `ansible-playbook -i inventory.ini ./playbooks/proxmox-update.yml` 

- sudo.yml: grants ubuntu user sudo access
  Usage: `ansible-playbook -i inventory.ini ./playbooks/sudo.yaml --ask-pass --ask-become-pass` 

- sync_time_zones.yml: Synchronizes the timezone across the target machines.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/sync_time_zones.yml`

- update_containers.yml: updates all contaienrs
  Usage: `ansible-playbook -i inventory.ini ./playbooks/timezone/update_containers.yml`

- update_packages.yml: Manages packages using APT package manager.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/update_packaes.yml`  


install ansible with ansible.sh in scripts folder

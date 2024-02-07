# HomeLab
## Scripts
iommu.sh - installs deps and enables iommu on the host


dmesg | grep -e DMAR -e IOMMU

## Proxmox
Scripts for proxmox and VMs
| Script          | Description                                          |
| ----------------| ---------------------------------------------------- |
| glusterfs.sh    | Sets up glusterfs for 3 ubuntu vms, docker swarm     |
| zfs_snapshot.sh | daily snapshot of proxmox install pool               |

## Unraid Scripts
These scripts are bash scripts I use on Unraid. 
| Script        | Description                                          |
| ------------- | ---------------------------------------------------- |
| Smart Check   | Enables a long smart check on disks A to Z.           |
| Restart       | Forces a server restart every 24 hours.               |
| Auto Delete   | Automatically deletes files with "unpack" and "failed" in the filename. |

## preseed
Preseed is a preseeded ubuntu iso

## Ansible Playbooks

The following Ansible playbooks are available:

- create_user.yml: Creates a user and ssh access on the target machines.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/create_user.yml --ask-pass --ask-become-pass`  
- docker.yml: installs docker, adds to /etc/hosts, creates docker swarm
  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/docker.yml` 
- install_curl.yml: installs curl
  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/install_curl.yml` 
- setup-cephfs.yml: installs ceph client and connects to cluster
  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/setup-cephfs.yml` 
- sync_time_zones.yml: Synchronizes the timezone across the target machines.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/timezone/timezone_sync.yml`
-update_containers.yml: updates all contaienrs
  Usage: `ansible-playbook -i inventory.ini ./playbooks/timezone/update_containers.yml`
- update_packages.yml: Manages packages using APT package manager.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/apt.yml`  

## Putty

Merge Putty configurations across devices.

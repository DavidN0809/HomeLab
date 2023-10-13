# HomeLab

## Proxmox
Scripts for proxmox and VMs
| Script          | Description                                          |
| ----------------| ---------------------------------------------------- |
| glusterfs.sh    | Sets up glusterfs for 3 ubuntu vms, docker swarm     |
| zfs_snapshot.sh | daily snapshot of proxmox install pool               |

## Scripts
These scripts are bash scripts I use on Unraid. 
| Script        | Description                                          |
| ------------- | ---------------------------------------------------- |
| Smart Check   | Enables a long smart check on disks A to Z.           |
| Restart       | Forces a server restart every 24 hours.               |
| Auto Delete   | Automatically deletes files with "unpack" and "failed" in the filename. |

## Ansible Playbooks

The following Ansible playbooks are available:

- proxmox_setup.yml: Disables annoying pop up in proxmox.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/proxmox_setup.yml`
  
- create_user.yml: Creates a user on the target machines.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/create_user.yml --ask-pass --ask-become-pass`  

- wol.yml: Enables Wake On LAN (WOL).  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/wol.yml`

- timezone_sync.yml: Synchronizes the timezone across the target machines.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/timezone/timezone_sync.yml`

- apt.yml: Manages packages using APT package manager.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/apt.yml`  

## Putty

Merge Putty configurations across devices.

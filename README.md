# HomeLab

## Scripts
These scripts are bash scripts I use on Unraid. 

| Script        | Description                                          |
| ------------- | ---------------------------------------------------- |
| Smart Check   | Enables a long smart check on disks A to Z.           |
| Restart       | Forces a server restart every 24 hours.               |
| Auto Delete   | Automatically deletes files with "unpack" and "failed" in the filename. |

## Ansible Playbooks

The following Ansible playbooks are available:

- create_user.yml: 
- Creates a user on the target machines. 
- Usage: `ansible-playbook -i inventory.ini ./playbooks/create_user.yml --ask-pass --ask-become-pass`
- wol.yml: Enables Wake On LAN (WOL). Usage: `ansible-playbook -i inventory.ini ./playbooks/wol.yml`
- ssh_key.yml: Configures SSH key authentication on the target machines. Usage: `ansible-playbook -i inventory.ini ./playbooks/ssh_key.yml --ask-pass --ask-become-pass`
- timezone_sync.yml: Synchronizes the timezone across the target machines. Usage: `ansible-playbook -i inventory.ini ./playbooks/timezone/timezone_sync.yml`
- apt.yml: Manages packages using APT package manager. Usage: `ansible-playbook -i inventory.ini ./playbooks/apt.yml`

## Putty

Merge Putty configurations across devices.

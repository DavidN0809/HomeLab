# HomeLab
## Ansible Playbooks

The following Ansible playbooks are available:

- create_user.yml: Creates a user and ssh access on the target machines.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/create_user.yml --ask-pass --ask-become-pass`  
- docker.yml: installs docker, adds to /etc/hosts, creates docker swarm

  Usage: `ansible-playbook -i inventory.ini ./playbooks/docker.yml` 
- install_curl.yml: installs curl
  Usage: `ansible-playbook -i inventory.ini ./playbooks/install_curl.yml` 

- mount_nfs,yml: mounts various nfs shares as guest from unRaid Box
  Usage: `ansible-playbook -i inventory.ini ./playbooks/mount_nfs.yml` 

- setup-cephfs.yml: installs ceph client and connects to cluster
  Usage: `ansible-playbook -i inventory.ini ./playbooks/setup-cephfs.yml` 

- sudo.yml: grants ubuntu user sudo access
  Usage: `ansible-playbook -i inventory.ini ./playbooks/sudo.yaml --ask-pass --ask-become-pass` 

- sync_time_zones.yml: Synchronizes the timezone across the target machines.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/timezone/timezone_sync.yml`

- update_containers.yml: updates all contaienrs
  Usage: `ansible-playbook -i inventory.ini ./playbooks/timezone/update_containers.yml`

- update_packages.yml: Manages packages using APT package manager.  
  Usage: `ansible-playbook -i inventory.ini ./playbooks/update_packaes.yml`  

add the line `export PATH="$HOME/.local/bin:$PATH"`

` source ~/.bashrc`

`python3 -m pip install --user ansible`

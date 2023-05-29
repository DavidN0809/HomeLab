# HomeLab
## Scripts
| ------------- | ------------- |
| Smart check  | enables a long smart check on disks a-z  |
| Restart  | forces a restart of server every 24hours |
| Auto delete | Auto delete files with unpack and failed in the filename |
## Ansible playbooks
| ------------- | ------------- |

```bash
ansible-playbook -i inventory.ini ./playbooks/create_user.yml --ask-pass ----ask-become-pass
ansible-playbook -i inventory.ini ./playbooks/wol.yml
ansible-playbook -i inventory.ini ./playbooks/ssh_key.yml --ask-pass ----ask-become-pass
ansible-playbook -i inventory.ini ./playbooks/timezone/timezone_sync.yml --ask-pass ----ask-become-pass
ansible-playbook -i inventory.ini ./playbooks/apt.yml --ask-pass ----ask-become-pass --ask-user ansibleuser
```

## Putty
Merge putty across devices

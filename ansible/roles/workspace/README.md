# Ansible role for **EDIT ME**

Ansible role which makes **add more verbose description here**

### Content
- [General info](#general-info) - features, support matrix, tags
- [Usage](#usage) - how to use the role
- [Usecases](#usecases)
    - [Basic scenario](#basic-scenario) for almost all cases
    - [Advanced scenario](#advanced-scenario) for specific cases
- [Development notes](#development-notes)
- [License](#license)

### General info
Role features:
- DO WOULD YOU LIKE GREEN EGGS AND HAM?
- I DO NOT LIKE THEM,SAM-I-AM.
- I DO NOT LIKE GREEN EGGS AND HAM.

Support matrix:

| Distribution |       status       |
|--------------|:------------------:|
| Ubuntu 20.04 | :white_check_mark: |
| Debian 11.x  |   :interrobang:    |
| CentOS 7     |     :no_entry:     |

- :white_check_mark: - fully tested, should works fine
- :interrobang: - maybe works, not tested
- :x: - don't have official support
- :no_entry: -  not supported by this role

Tags (could be used to perform specific tasks on existing deployment):
- `TAG1` - add tag description

### Usage

1. Define target hosts in `inventory` file.
2. Create a playbook, define necessary variables and add `rolename` to roles.
3. Run `ansible-playbook` utility using prepared inventory and playbook.

For complete example, checkout [vagrant](./vagrant) directory.

### Usecases

#### Basic scenario
Setup standalone server. Perfect for local or development deployments.

Inventory:
```ini
[vagrant_servers]
vg1 ansible_host=192.168.56.11
```

Playbook:
```yaml
- hosts: vagrant_servers
  remote_user: vagrant
  become: yes
  roles:
    - rolename
```

#### Advanced scenario
Setup cluster. Perfect for staging and production deployments.

Inventory:
```ini
[vagrant_servers]
vg1 ansible_host=192.168.56.11
vg2 ansible_host=192.168.56.12
```

Playbook:
```yaml
- hosts: vagrant_servers
  remote_user: vagrant
  become: yes
  vars:
    enable_cluster: True
  roles:
    - rolename
```

### Development notes
For local testing and development use [vagrant](./vagrant) example **or** [molecule](./molecule) tests.

Vagrant (Vagrant and VirtualBox packages should be installed and configured):
```shell
$ git clone https://git.postgrespro.ru/ansible/roles/template0
$ cd template0
$ make up/ubuntu
$ make provision

... destroy when environment not needed
$ make destroy
```

Molecule (python packages 'molecule' and 'molecule-docker' should be installed):
```shell
$ git clone https://git.postgrespro.ru/ansible/roles/template0
$ cd template0
$ molecule test
```

### License
Licensed under the BSD-3 License. See the [LICENSE.md](LICENSE.md) file for details.
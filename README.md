# workspace

Tools for create and manage workspace.

## Getting started

```
$ sudo apt update
$ sudo apt install git make python3-pip virtualenv
$ git clone https://github.com/lesovsky/workspace ~/Git/github.com/lesovsky
$ cd ~/Git/github.com/lesovsky/workspace
$ make init
$ source /home/lesovsky/.python-env-workspace/bin/activate
$ cd ansible
$ ansible-playbook --ask-become-pass plays/setup-workspace.yaml
```
# workspace

Tools for create and manage workspace.

## Getting started

1. Upgrade the system and reboot before the start.
    ```
    $ sudo apt update && sudo apt upgrade -y
    $ sudo apt autoremove
    $ sudo reboot
    ```

2. Install core dependencies, download `workspace` repo.
    ```
    $ sudo apt install --no-install-recommends git make python3-pip virtualenv
    $ git clone https://github.com/lesovsky/workspace ~/Git/github.com/lesovsky/workspace
    ```

3. Init repo and start `workspace` setup.
    ```
    $ cd ~/Git/github.com/lesovsky/workspace
    $ make init
    $ source ~/.python-env-workspace/bin/activate
    $ cd ansible
    $ ansible-playbook --ask-become-pass plays/setup-workspace.yaml
    ```
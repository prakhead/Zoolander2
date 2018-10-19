# Zoolander2

Zoolander2 config files (full description to follow).

Tested on Ubuntu 18.04

## Installation
* Clone the repository: `git clone https://github.com/prakhead/Zoolander2.git`
* Edit the proxy_ip_address variable in install_ansible.yml to reflect the ip address of the local machine: `nano install_docker.yml`
* Run the bash script (to install packages and start ansible script): `cd ~/Zoolander2 && bash ./install-ansible.sh`

Now you should be able to point the machines you want to use this proxy's DNS server to the local IP and all should work.

## IP address change
If the IP address of the machine should change you should only need to remove and recreate the dns proxy container
* Stop container: `docker stop steamcache-dns`
* Remove container: `docker rm steamcache-dns`
* Change proxy_ip_address variable in install_ansible.yml: `nano install_docker.yml`
* Recreate container: `ansible-playbook --ask-become-pass ./install_docker.yml`

## Update to latest version
* To get the latest version of these files: `cd ~/Zoolander2 && git pull`

## Monitoring system
I have thown together a tmux script that should show some different indicators of system activity: `sudo  ./load_monitor.sh && sudo tmux attach`

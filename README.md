# Zoolander2

Zoolander2 config files (full description to follow).

Tested on Ubuntu 18.04

## Installation
* Clone the repository: `git clone https://github.com/prakhead/Zoolander2.git`
* Edit the proxy_ip_address variable in install_ansible.yml to reflect the ip address of the local machine: `nano install_ansible.yml`
* Run the bash script (to install packages and start ansible script): `cd Zoolander2 && bash ./install-docker.sh`

Now you should be able to point the machines you want to use this proxy's DNS server to the local IP and all should work.

## IP address change
If the IP address of the machine should change you should only need to remove and recreate the dns proxy container
* Stop container: `docker stop steamcache-dns`
* Remove container: `docker rm steamcache-dns`
* Change proxy_ip_address variable in install_ansible.yml: `nano install_ansible.yml`
* Recreate container: `cd Zoolander2 && bash ./install-docker.sh`

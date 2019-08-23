#!/bin/bash
sudo apt update
sudo apt upgrade -y 
sudo add-apt-repository universe
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
ansible-playbook --ask-become-pass ./install_docker.yml

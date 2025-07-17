# Dockerfile for Ansible controller

FROM ubuntu:latest

# Update + install needed packages
RUN apt update && apt install -y ansible openssh-client openssh-server sudo

# Create/manage user
RUN useradd -m ansible && echo "ansible:ansible" | chpasswd && adduser ansible sudo

# SSH setup
RUN mkdir -p /home/ansible/.ssh
RUN chown ansible:ansible /home/ansible/.ssh
RUN mkdir /ssh
RUN chown ansible:ansible /ssh

# SSH key setup
USER ansible
WORKDIR /home/ansible
RUN ssh-keygen -t rsa -f /home/ansible/.ssh/id_rsa -q -N ""
RUN cp /home/ansible/.ssh/id_rsa.pub /ssh/id_rsa.pub

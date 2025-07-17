# Dockerfile for Nodes controller

FROM ubuntu:latest

# Update + install needed packages
RUN apt update && apt install -y openssh-server sudo

# Create/manage user
RUN useradd -m user && echo "user:user" | chpasswd && adduser user sudo

# SSH setup
RUN mkdir -p /run/sshd
RUN mkdir -p /home/user/.ssh
RUN mkdir /ssh
RUN chown user:user /ssh

# SSH key import
CMD cat /ssh/id_rsa.pub >> /home/user/.ssh/authorized_keys && \
chown user:user /home/user/.ssh/authorized_keys && \
chmod 600 /home/user/.ssh/authorized_keys && \
/usr/sbin/sshd -D

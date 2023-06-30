#!/bin/bash

# Install required packages
yum install -y openssh-server openssh-clients

# Configure SSH server for SFTP
sed -i 's/^#Subsystem\ sftp\ \/usr\/libexec\/openssh\/sftp-server/Subsystem\ sftp\ \/usr\/libexec\/openssh\/sftp-server/' /etc/ssh/sshd_config

# Allow SFTP only and Chroot users
echo "
Match Group sftp
    ChrootDirectory %h
    ForceCommand internal-sftp
    AllowTcpForwarding no
    X11Forwarding no" >> /etc/ssh/sshd_config

# Create a group for SFTP users
groupadd sftpusers

# Restart SSH service
systemctl restart sshd

# Enable and start the SSH service
systemctl enable sshd
systemctl start sshd

echo "SFTP configuration completed."
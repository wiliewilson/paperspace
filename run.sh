#!/bin/bash
env
rm -Rf /etc/apt/sources.list
mv sources.list /etc/apt/sources.list
apt-get update
apt-get install -y openssh-server
echo 'root:Ytngfhjkz123' | chpasswd
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

echo "export VISIBLE=now" >> /etc/profile
mv .bashrc /root/.bashrc

/usr/sbin/sshd -D


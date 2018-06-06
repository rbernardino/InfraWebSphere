#!/bin/bash

##################################################
# Setup script common for all Linux boxes
##################################################

# Install packages
yum install -y net-tools.x86_64

# Set timezone (http://www.thegeekstuff.com/2010/09/change-timezone-in-linux/)
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Singapore /etc/localtime

ulimit -n 10240

echo 'Pausing for 10 secs'
sleep 10

echo 'Installing PowerShell for Linux'
# Add MSFT's repo for RHEL-based packages
# https://docs.microsoft.com/en-us/windows-server/administration/Linux-Package-Repository-for-Microsoft-Software
sudo rpm -Uvh http://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm

# Install PowerShell using yum
yum install -y powershell

sleep 5
echo 'Installing Powershell DSC for Linux'
wget https://github.com/Microsoft/omi/releases/download/v1.1.0-0/omi-1.1.0.ssl_100.x64.rpm \
  -O /opt/omi.rpm
wget https://github.com/Microsoft/PowerShell-DSC-for-Linux/releases/download/v1.1.1-294/dsc-1.1.1-294.ssl_100.x64.rpm \
  -O /opt/dsc.rpm
sudo rpm -Uvh /opt/omi.rpm /opt/dsc.rpm

echo 'Pausing for 5 secs'
sleep 5

echo 'Configuring sshd'
cp -p /vagrant/config/sshd_config /etc/ssh/sshd_config
chmod 644 /etc/ssh/sshd_config
service sshd restart

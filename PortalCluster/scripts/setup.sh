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

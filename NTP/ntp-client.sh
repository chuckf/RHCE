#!/bin/bash

#####
# Configuration for an NTP client.
#####

# Verify that server argument exists
if [ -z "$1" ]
  then
    echo "Provided the name of the primary ntp server"
    exit -1
fi

SERVER=$1

# Disable chrony
systemctl stop chronyd
systemctl disable chronyd
systemctl mask chronyd

# Set timezone
timedatectl set-timezone America/New_York

# Install software
yum install ntp -y

# Edit /etc/ntp.conf
sed -i '/^server/s/^/#/g' /etc/ntp.conf
sed -i "/#server 3/ a server $SERVER iburst" /etc/ntp.conf

# Start ntpd
systemctl enable ntpd
systemctl start ntpd
systemctl status ntpd

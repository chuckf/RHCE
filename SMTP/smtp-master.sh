#!/bin/bash

#####
# Configuration for an SMTP MTA.
#####

# Install software
yum install -y postfix

# Open firewall port
firewall-cmd --add-service=postfix && firewall-cmd --add-service=postfix --permanent

# Enable and start service
systemctl enable postfix
systemctl start postfix

# Configure /etc/postfix/main.cf
myhostname = mail.example.com
mydomain = example.com
myorigin = $mydomain
inet_interfaces = all
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
mynetworks = 192.168.1.0/24, 127.0.0.0

# Verify configuration
postfix check
postconf -n

# Restart postfix to apply changes
yum restart postfix

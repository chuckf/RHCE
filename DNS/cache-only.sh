#!/bin/bash

#####
# Configuration for a cache-only DNS server. Required for RHCE.
#####

# Install BIND package
yum install -y bind

# Change /etc/named.conf to *listen-on any* interface
sed -i 's/listen-on port 53 { 127.0.0.1/listen-on port 53 { any/' /etc/named.conf

# Allow queries from any interface
sed -i 's/allow-query     { localhost/allow-query     { any/' /etc/named.conf

# Disable DNSSEC validation
sed -i 's/dnssec-validation yes;/dnssec-validation no;/' /etc/named.conf

# Test configuration by running named-checkconf
named-checkconf

# Ensure the firewall allows DNS port 53
firewall-cmd --add-service=dns
firewall-cmd --add-service=dns --permanent

# Configure named to start on boot
systemctl enable named

# Start the named daemon
systemctl start named

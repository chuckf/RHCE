#!/bin/bash

#####
# Configuration for a Kerberos client.
#####

# Install required packages
yum install -y krb5-workstation pam_krb5

# Retrieve krb5.conf file from kerberos server
scp root@kerberos.example.com:/etc/krb5.conf /etc/krb5.conf

# Register the client machine into the kerberos database
kadmin
addprinc -randkey host/openvpn.scottctaylor.com
ktadd host/openvpn.scottctaylor.com
quit

# Edit /etc/ssh/ssh_config and allow GSSAPI rules
GSSAPIAuthentication yes
GSSAPIDelegateCredentials yes

# Allow krb5 pan authentication
authconfig --enablekrb5 --update

# Test user authentication
su - user01

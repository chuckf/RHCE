#!/bin/bash

#####
# Configuration to forward all mail to central mail server.
#####

SMTPSERVER=$1

if [ -z "$1" ]
  then
    echo "EXITING: Provide the name of the central smtp server"
    exit -1
fi

# Install postfix
yum install postfix mailx -y

# Enable and start service
systemctl enable postfix
systemctl start postfix

# Edit /etc/postfix/main.cf
sed -i "s/#myhostname = host.domain.tld/myhostname = $HOSTNAME/" /etc/postfix/main.cf
sed -i "s/#mydomain = domain.tld/mydomain = `echo $HOSTNAME | cut -d "." -f 2,3`/" /etc/postfix/main.cf
sed -i "s/#myorigin = \$mydomain/myorigin = \$mydomain/" /etc/postfix/main.cf
sed -i "s/inet_interfaces = localhost/#inet_interfaces = localhost/" /etc/postfix/main.cf
#sed -i "s/mydestination = \$myhostname, localhost.\$mydomain, localhost/ mydestination = /" /etc/postfix/main.cf
sed -i "s/#relayhost = \$mydomain/relayhost = $SMTPSERVER/" /etc/postfix/main.cf

# Restart service
systemctl restart postfix

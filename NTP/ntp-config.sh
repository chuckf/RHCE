#!/bin/bash

#####
# Configuration for an NTP primary server.
#####

# Install ntpd software
yum install ntp -y

# Edit /etc/ntp.conf
Uncomment broadcast and set network restrictions

# Change Timezone
timedatectl set-timezone America/New_York

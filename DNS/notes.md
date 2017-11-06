DNS - Domain Name Service

DNS is responsible for mapping device ip addresses to hostnames. In the case of the RHCE, we use a software called BIND to make that possible.

TLD - Top Level Domain
Example: .com

Second-Level Domain
Example: .scottctaylor

Leaf
Example: www

FQDN - Fully Qualified Domain Name
www.scottctaylor.com

DNS Root Servers - There are DNS servers that handle each TLD. For BIND, this file is located in /var/named/named.ca by default.

Primary DNS Server - master - has authority over its domain and maintains that domain's original data

Secondary DNS Server - slave - also has authority over domain data; however, the data is copied from the primary server via zone transfers

Caching DNS Server - no authority over the domain. This simply receives requests, relays to primary dns server, then stores the answer in memory for the next time. Helpful for speeding up request times.

A or AAAA - Address Record
CNAME - Canonical Name Record
MX - Mail Exchanger Record
NS - Nameserver Record
PTR - Pointer Record
SOA - Start of Authority


Installation:
Remember - the required.sh script can be used to automate all of this and create a caching only name server.

1. yum install bind
2. Edit /etc/named.conf to reflect the following
  listen-on port 53 { any; };
  allow-query { any; };
  recursion yes;
  dnssec-enable no;
  dnssec-validaton no;
3. named-checkconf
4. systemctl enable named
5. systemctl start named
6. systemctl status named
7. firewall-cmd --add-service=dns && firewall-cmd --add-service=dns --permanent

Client:
1. Edit /etc/resolv.conf to point to the server by adding a line stating
  nameserver (ip address)
2. Test dns names by typing
  dig (hostname)

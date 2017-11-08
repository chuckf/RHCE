These are the steps required to create a kerberos server. Keep in mind, this is not necessary for the RHCE, however, this is required to test configurations in a lab environment.

1. Install Kerberos Packages  
  yum install krb5-server pam_krb5

2. Edit the /var/kerberos/krb5kdc/kdc.conf file and replace EXAMPLE.COM with your own realm

3. Edit the /etc/krb5.conf file and uncomment all the lines and replace example.com with your own domain

4. Edit the /var/kerberos/krb5kdc/kadm5.acl file and replace EXAMPLE.COM with your own realm

5. Generate the Kerberos database by running the command: kdb5_util create -s -r EXAMPLE.COM

6. Start Kerberos and enable them to start on boot  
  systemctl start krb5kdc kadmin  
  systemctl enable krb5kdc kadmin  

7. Create a user to test with: useradd user01

8. Launch the Kerberos administration tool: kadmin.local

9. Create the user01 principle: addprinc user01

10. Add the kdc hostname to the kerberos database: addprinc -randkey host/kerberos.example.com

11. Create a local copy to the /etc/krb5.keytab: file ktadd host/kerberos.example.com

12. Exit the kerberos administration tool by entering: quit

13. Uncomment the following lines in the /etc/ssh/ssh_config file:  
  GSSAPIAuthentication yes  
  GSSAPIDelegateCredentials yes  

14. Reload the ssh service: systemctl restart sshd

15. Configure Kerberos PAM authentication: authconfig --enablekrb5 --update

SMTP - Simple Mail Transport Protocol

Network protocol that runs on 25 responsible for transporting email messages from one email server to another.

Operational Terms:  
Mail User Agent (MUA): email client program used to compose emails and pull messages into inbox

Mail Submission Agent (MSA): responsible for accepting messages from MUA. May be integrated with MTA.

Mail Transport Agent (MTA): responsible for transporting a message from a sending mail server and receiving from other mail servers. Solutions include Postfix and sendmail.

Post Office Protocol (POP): protocol used by the MUA and is responsible for downloading user mail messages into user inboxes. Uses port 110

Internet Message Access Protocol (IMAP): Similar to POP but uses port 143.

Smart Host (Relay): MTA that delivers emails on the behalf of other systems.

Mail Queue: location where submitted email messages are stored temporarily for further processing. /var/spool/postfix

Mailbox: location for storing user emails. /var/spool/mail

MUA -> MSA -> MTA -> Network / Internet -> MTA -> MDA -> MUA 

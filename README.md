# ipgetter

ipgetter is a Bash script that grabs your current external IP address via dig and sends it to a specified email

The default directory that this should be cloned or downloaded to is /usr/bin/ipgetter
If you do not download there then you will need to change the directory accordingly

Additionally, the folder must have the proper access as well as the script
$ sudo chmod 777 /usr/bin/ipgetter
$ sudo chmod 755 /usr/bin/ipgetter/ipgetter.sh

ipgetter also requires sendmail to run - directions for centOS are below
 
To install with centOS:
Step 1
Add the centOS 7 epel repos
$ sudo yum install epel-release

Step 2
Install sendmail
$ sudo yum install sendmail sendmail-cf m4

Step 3
Configure sendmail by editing /etc/mail/sendmail.mc
  Configure Daemon Options: DAEMON_OPTIONS('Port=smtp,Addr=127.0.0.1,Name=MTA)dnl
  Set LOCAL_DOMAIN to your hostname: LOCAL_DOMAIN('example.com')dnl 
  #I left mine default and just changed the Masquerade

Step 4
Update sendmail's config
$ sudo make -C /etc/mail
Restart sendmail 
$ sudo service sendmail restart

This only allows sendmail to send outbound


It is recommended to set up a cron job to run this daily or whenever you might need external access to your network
The script will also create two files
ip.log - This is where all the activity is logged each time the script is run and it will tell you whether it is a new or current ip
nowipaddr.txt - This file houses the current ip address and is updated accordingly



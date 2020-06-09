# ipgetter

ipgetter is a Bash script that grabs your current external IP address via dig and sends it to a specified email</br></br>

The default directory that this should be cloned or downloaded to is /usr/bin/ipgetter</br>
If you do not download there then you will need to change the directory accordingly</br></br>

Additionally, the folder must have the proper access as well as the script</br>
$ sudo chmod 777 /usr/bin/ipgetter</br>
$ sudo chmod 755 /usr/bin/ipgetter/ipgetter.sh</br></br>

ipgetter also requires sendmail to run - directions for centOS are below</br></br>
 
To install with centOS:</br>
Step 1</br>
Add the centOS 7 epel repos</br>
$ sudo yum install epel-release</br></br>

Step 2</br>
Install sendmail</br>
$ sudo yum install sendmail sendmail-cf m4</br></br>

Step 3</br>
Configure sendmail by editing /etc/mail/sendmail.mc</br>
  Configure Daemon Options: DAEMON_OPTIONS('Port=smtp,Addr=127.0.0.1,Name=MTA)dnl</br>
  Set LOCAL_DOMAIN to your hostname: LOCAL_DOMAIN('example.com')dnl </br>
  #I left mine default and just changed the Masquerade</br></br>

Step 4</br>
Update sendmail's config</br>
$ sudo make -C /etc/mail</br>
Restart sendmail </br>
$ sudo service sendmail restart</br></br>

This only allows sendmail to send outbound</br></br>


It is recommended to set up a cron job to run this daily or whenever you might need external access to your network</br>
The script will also create two files</br>
ip.log - This is where all the activity is logged each time the script is run and it will tell you whether it is a new or current ip</br>
nowipaddr.txt - This file houses the current ip address and is updated accordingly</br>



#########################################################################

#### ########      ######   ######## ######## ######## ######## ########
 ##  ##     ##    ##    ##  ##          ##       ##    ##       ##     ##
 ##  ##     ##    ##        ##          ##       ##    ##       ##     ##
 ##  ########     ##   #### ######      ##       ##    ######   ########
 ##  ##           ##    ##  ##          ##       ##    ##       ##   ##
 ##  ##           ##    ##  ##          ##       ##    ##       ##    ##
#### ##            ######   ########    ##       ##    ######## ##     ##

############################
## IP GETTER		  ##
## Version 1.0		  ##
## Author: alphasixty	  ##
## Copyright: None	  ##
## License: Open Source   ##
## Maintainer: alphasixty ##
############################

#!/bin/bash
#Assign the file in order to test against it later
CHECK_OLD_IP="/usr/bin/ipgetter/nowipaddr.txt"

#Pull IP value
OLD_IP=$(cat /usr/bin/ipgetter/nowipaddr.txt)

#Use the dig command to pull your current public IP address
NEW_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

#Define log file
LOG="/usr/bin/ipgetter/ip.log"
timestamp=$( date +%T )
curDate=$( date +"%m-%d-%y" )

#Check to see if the nowipaddr.txt
if [ -f $CHECK_OLD_IP ]; 
then
	#If their is a current IP this checks to see if it has changed, if none then it appends to the log file, if it has changed it will kick off an email.
	if [ "$NEW_IP" = "$OLD_IP" ]; 
	then
		echo $curDate $timestamp " Current IP address: " $OLD_IP >> $LOG
	else
		#Define the email address by changing youremail@youremail.com
		echo -e "Subject: New IP Assignment \n\n " $curDate $timestamp "New IP address:" $NEW_IP | sendmail -v youremail@gmail.com
		echo $NEW_IP > $CHECK_OLD_IP
		echo $curDate $timestamp " IP address changed from: " $OLD_IP " To: " $NEW_IP >> $LOG
	fi
else
	#If their is no previous IP then this will create the file and kick off an email 
	echo $NEW_IP > $CHECK_OLD_IP
	echo -e "Subject: New IP Assignment \n\n " $curDate $timestamp "New IP address:" $NEW_IP | sendmail -v youremail@gmail.com
	echo $curDate $timestamp " New IP address: " $NEW_IP >> $LOG
fi

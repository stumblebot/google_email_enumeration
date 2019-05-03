#!/bin/bash

if [ -z $1 ];
then
	echo "I need a file containing email addresses you want to check"
	echo "Example:"
	echo "	./google_email_enumeration.sh email.list"
	echo ""
	echo "Props to @x0rz who turned me on to this"
	exit
fi

for i in $(cat $1);
do
	echo -n $i:
	if [ -z "$(curl https://mail.google.com/mail/gxlu?email=$i -i -s| grep -i Set-Cookie:)" ];
	then 
		echo FAIL;
	else 
		echo SUCCESS;
	fi
done

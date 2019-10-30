#!/bin/sh
echo "Run time value $1"
ls -l
if [ -f $1 ]; then
echo "Deleting old war"
rm sample.war
else
echo "File not found"
fi

echo "sleeping mode"
sleep 5

echo "Downloading the sample war file from internet"
wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war
#mv sample.war webapp.war
ls -l

echo "TOMCAT DEPLOYMENT"
echo "-------Stopping the service------"
service tomcat8 stop

echo "copying the war file"
cp sample.war /var/lib/tomcat8/webapps/

sleep 5

echo "-------------Starting tomcat service------------"
service tomcat8 start


#!/bin/bash

### Variables ###
# PORT - this is where the httpd daemon will listen
# Default port is standard 80, but you need root permissions
# to listen to any port lower than 1024. 
# This is a programming excercise, so we'll listen up high.
PORT=8888
# HTTP_HOME
# Directory where you store your html.
HTTP_HOME=/var/www/html

while true 
do 
  VAR=`nc -l $PORT | grep HTTP | awk '{print $2}' | sed -e 's/\///'`
  echo $VAR was requested.
  nc -l $PORT < $HTTP_HOME/$VAR 
done

#!/bin/bash

##
## TESTING
##




echo -e "\n"
read -p 'Enter  DOMAIN_NO (eg: 1 ): ' DOMAIN_NO

if [ "$DOMAIN_NO" = "" ]; then
   DOMAIN_NO="110"
fi


echo -e "\n"
read -p 'Enter  container name (eg: echo1 ): ' CONTAINER_NAME

if [ "$CONTAINER_NAME" = "" ]; then
   CONTAINER_NAME="echo110"
fi





docker build  --rm -t test-$DOMAIN_NO/hello:v0.01 .


docker run -d --name $CONTAINER_NAME--rm test-$DOMAIN_NO/hello:v0.01


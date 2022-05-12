#!/bin/bash

if [ -z $MAILDOMAIN ]; then
  echo "MAILDOMAIN Environment Variable Cannot Be Empty."
elif [[ ! $MAILDOMAIN =~ ^((!(http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}$ ]]; then
  echo "Wrong MAILDOMAIN Environment Variable."
else
  echo "MAILDOMAIN : $MAILDOMAIN"
  sed -i "s/MYHOSTNAME/$MAILDOMAIN/" /etc/postfix/main.cf
fi

if [ -z $DOMAIN ]; then
  echo "DOMAIN Environment Variable Cannot Be Empty."
elif [[ ! $DOMAIN =~ ^((!(http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}$ ]]; then
  echo "Wrong DOMAIN Environment Variable."
else
  echo "DOMAIN : $DOMAIN"
  sed -i "s/MYDOMAIN/$DOMAIN/" /etc/postfix/main.cf
fi

#postfix start

tail -f /dev/null
#!/bin/bash

if [[ $LDAP_URIS = "" ]]; then
  echo "Please enter 'LDAP_URIS' environment variable."
  exit 1
else
  sed -i --expression "s@LDAP_URIS@$LDAP_URIS@g" /etc/postfix/ldap-aliases.cf
  sed -i --expression "s@LDAP_URIS@$LDAP_URIS@g" /etc/postfix/virtual_mailbox
  sed -i --expression "s@LDAP_URIS@$LDAP_URIS@g" /etc/postfix/virtual_uids
fi

if [[ $LDAP_PORT -eq "" ]]; then
  echo "Please enter 'LDAP_PORT' environment variable."
  exit 1
else
  sed -i --expression "s@LDAP_PORT@$LDAP_PORT@g" /etc/postfix/ldap-aliases.cf
  sed -i --expression "s@LDAP_PORT@$LDAP_PORT@g" /etc/postfix/virtual_mailbox
  sed -i --expression "s@LDAP_PORT@$LDAP_PORT@g" /etc/postfix/virtual_uids
fi

if [[ $LDAP_BASE = "" ]]; then
  echo "Please enter 'LDAP_BASE' environment variable."
  exit 1
else
  sed -i --expression "s/LDAP_BASE/$LDAP_BASE/g" /etc/postfix/ldap-aliases.cf
  sed -i --expression "s/LDAP_BASE/$LDAP_BASE/g" /etc/postfix/virtual_mailbox
  sed -i --expression "s/LDAP_BASE/$LDAP_BASE/g" /etc/postfix/virtual_uids
fi

if [[ $LDAP_DN = "" ]]; then
  echo "Please enter 'LDAP_DN' environment variable."
  exit 1
else
  sed -i --expression "s@LDAP_DN@$LDAP_DN@g" /etc/postfix/ldap-aliases.cf
  sed -i --expression "s@LDAP_DN@$LDAP_DN@g" /etc/postfix/virtual_mailbox
  sed -i --expression "s@LDAP_DN@$LDAP_DN@g" /etc/postfix/virtual_uids
fi

if [[ $LDAP_PASSWORD = "" ]]; then
  echo "Please enter 'LDAP_PASSWORD' environment variable."
  exit 1
else
  sed -i --expression "s/LDAP_PASSWORD/$LDAP_PASSWORD/g" /etc/postfix/ldap-aliases.cf
  sed -i --expression "s/LDAP_PASSWORD/$LDAP_PASSWORD/g" /etc/postfix/virtual_mailbox
  sed -i --expression "s/LDAP_PASSWORD/$LDAP_PASSWORD/g" /etc/postfix/virtual_uids
fi

if [[ $DOMAIN = "" ]]; then
  echo "Please enter 'DOMAIN' environment variable."
  exit 1
else
  sed -i --expression "s@DOMAIN@$DOMAIN@g" /etc/postfix/ldap-aliases.cf
  sed -i --expression "s@DOMAIN@$DOMAIN@g" /etc/postfix/main.cf
  sed -i --expression "s@DOMAIN@$DOMAIN@g" /etc/postfix/virtual_domains
  sed -i --expression "s@DOMAIN@$DOMAIN@g" /etc/postfix/virtual_mailbox
  sed -i --expression "s@DOMAIN@$DOMAIN@g" /etc/postfix/virtual_uids
fi

if [[ $DOVECOT_URL = "" ]]; then
  echo "Please enter 'DOVECOT_URL' environment variable."
  exit 1
else
  sed -i --expression "s@DOVECOT_URL@$DOVECOT_URL@g" /etc/postfix/main.cf
fi

if [[ $MYHOSTNAME = "" ]]; then
  echo "Please enter 'MYHOSTNAME' environment variable."
  exit 1
else
  sed -i --expression "s@MYHOSTNAME@$MYHOSTNAME@g" /etc/postfix/main.cf
fi

if [[ $TLS = "yes" ]]; then
  TLS=$TLS
else
  TLS="no"
fi
sed -i --expression "s@TLS@$TLS@g" /etc/postfix/main.cf

if [[ $TLS = "yes" && $TLS_CERT = "" ]]; then
  echo "Please enter 'TLS_CERT' environment variable when you use 'TLS=yes'."
  exit 1
else
  sed -i --expression "s@#smtpd_tls_cert_file = TLS_CERT@#smtpd_tls_cert_file = $TLS_CERT@g" /etc/postfix/main.cf
fi

if [[ $TLS = "yes" && $TLS_KEY = "" ]]; then
  echo "Please enter 'TLS_KEY' environment variable when you use 'TLS=yes'."
  exit 1
else
  sed -i --expression "s@#smtpd_tls_key_file = TLS_KEY@smtpd_tls_key_file = $TLS_KEY@g" /etc/postfix/main.cf
fi

postfix start-fg

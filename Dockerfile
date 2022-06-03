FROM ubuntu:latest

LABEL email="wsskorea.cloud@gmail.com" \
      name="WSSKOREA CLOUD" \
      version="0.1" \
      descripbion="A Postfix Server on Alpine Linux."

USER root

RUN apt-get update -y && \
    apt-get install -y postfix postfix-ldap vim bash mailutils && \
    mkdir -p /var/vmail/wsskorea.cloud && \
    chown -R root:mail /var/vmail && \
    chmod 2775 /var/vmail

COPY main.cf /etc/postfix/main.cf
COPY master.cf /etc/postfix/master.cf
COPY bounce.cf /etc/postfix/bounce.cf
COPY ldap-aliases.cf /etc/postfix/ldap-aliases.cf
COPY virtual_domains /etc/postfix/virtual_domains
COPY virtual_mailbox /etc/postfix/virtual_mailbox
COPY virtual_uids /etc/postfix/virtual_uids
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 25/tcp 465/tcp 587/tcp

SHELL ["/bin/bash"]

CMD ["/start.sh"]
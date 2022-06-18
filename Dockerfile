FROM alpine:3.16.0

RUN echo "https://dl-cdn.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories && \
    apk update && \
    apk add bash vim wget rpm openssl postfix postfix-ldap postfix-pcre

COPY bounce.cf /etc/postfix/bounce.cf
COPY ldap-aliases.cf /etc/postfix/ldap-aliases.cf
COPY main.cf /etc/postfix/main.cf
COPY master.cf /etc/postfix/master.cf
COPY virtual_domains /etc/postfix/virtual_domains
COPY virtual_mailbox /etc/postfix/virtual_mailbox
COPY virtual_uids /etc/postfix/virtual_uids
COPY run.sh /start.sh

ENTRYPOINT ["bash", "/start.sh"]

CMD ["tail", "-f", "/var/log/postfix.log"]
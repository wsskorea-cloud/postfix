FROM alpine:3.15.4

LABEL email="wsskorea.cloud@gmail.com" \
      name="WSSKOREA CLOUD" \
      version="0.1" \
      descripbion="A Postfix Server on Alpine Linux."

USER root

RUN apk update && \
    apk add postfix vim bash

COPY main.cf /etc/postfix/main.cf
COPY master.cf /etc/postfix/master.cf
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 25/tcp 465/tcp 587/tcp

SHELL ["/bin/bash"]

CMD ["/start.sh"]
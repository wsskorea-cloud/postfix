#!/bin/bash

#postfix start
service postfix start

tail -f /var/log/postfix.log
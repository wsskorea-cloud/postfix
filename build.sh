#!/bin/bash

#amazon-linux-extras install -y epel && yum install -y gcc db4 db4-devel m4
#ln -s /usr/include/libdb4/db.h /usr/include/db.h
#ln -s /usr/lib64/libdb4/libdb.so /usr/lib64/libdb.so
#wget http://mirror.postfix.jp/postfix-release/official/postfix-3.7.2.tar.gz
#tar -xvzf postfix-3.7.2.tar.gz
#cd postfix-3.7.2
#make tidy
#make
#yum install -y gcc
#amazon-linux-extras install -y epel
#yum install -y db4
#yum install -y db4-devel
#yum install -y m4
#ln -s /usr/include/libdb4/db.h /usr/include/db.h
#ln -s /usr/lib64/libdb4/libdb.so /usr/lib64/libdb.so
#yum install -y ldb-tools
#make

#basearch=$(arch)
#yum-config-manager --add-repo http://mirrorlist.ghettoforge.org/el/7/plus/$basearch/mirrorlist
#yum remove -y postfix*

wget https://mirror.ghettoforge.org/distributions/gf/el/7/plus/x86_64/postfix3-3.7.2-1.gf.el7.x86_64.rpm

#!/bin/bash

useradd -m $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
usermod -a -G www-data $FTP_USER

exec vsftpd /etc/vsftpd.conf

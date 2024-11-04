#!/bin/bash

useradd -m $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

exec vsftpd /etc/vsftpd.conf

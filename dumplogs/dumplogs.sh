#!/bin/bash

TIMESTAMP=`date +%F'T'%H-%M-%S`
FULLNAME=journalctl_server"$TIMESTAMP".tar.gz
cd /root

journalctl > /root/logs/journalctl_server.log
sleep 15

tar -czvf $FULLNAME /root/logs
sleep 15

cp /root/$FULLNAME /root/archived_logs

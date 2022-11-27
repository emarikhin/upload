#!/bin/bash

TIMESTAMP=`date +%F'T'%H-%M-%S`
FULLNAME=aleo_server"$TIMESTAMP".tar.gz
cd /root

journalctl > /root/logsUpload/upload/logs/server_name.log
sleep 60

tar -czvf $FULLNAME /root/logsUpload/upload/logs
sleep 30

cp /root/$FULLNAME /root/logsUpload/upload/archived_logs
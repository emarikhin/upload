#!/bin/bash
LOGNAME=name_server

TIMESTAMP=`date +%F'T'%H-%M-%S`
FULLNAME="$LOGNAME""$TIMESTAMP".tar.gz

# Remove all files in the archived directory that were generated more than 90 mins ago
cd /root/logsUpload/upload/archived_logs
find *.gz -mmin +90 -exec rm {} \;
sleep 10

journalctl -u aleo-prover > /root/logsUpload/upload/logs/"$LOGNAME".log
sleep 60

tar -czvf $FULLNAME /root/logsUpload/upload/logs
sleep 30

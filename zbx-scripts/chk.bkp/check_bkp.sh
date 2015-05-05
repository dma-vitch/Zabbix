#!/bin/sh
#ver 1.0.0
#$1 - location of log files
#$2 - type of find actionn (warn,error.failed etc)
count='sudo cat $1  | grep $(date +'%d-%b-%Y') | grep -i $2 | wc -l'
if [[ $count != 0 ]]; then
    echo -e "Failed backup!"
    exit
else
    echo -e "Compleate backup!"
    exit
fi

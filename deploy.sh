#!/bin/bash

if [ -z $4 ]; then
   echo "Usage: $0 <host> <db> <user> <pass>";
   exit;
fi

host=$1 
db=$2 
user=$3
pass=$4

echo "Updating $host:$db"

sh ./disable_revisioning.sh $host $db $user $pass; \
&& \
sh ./import_localities.sh $host $db $user $pass; \
&& \
sh ./import_meshblocks.sh $host $db $user $pass;

echo "Finished updating $host:$db"

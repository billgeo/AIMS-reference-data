#!/bin/bash

if [ -z $3 ]; then
   echo "Usage: $0 <host> <db> <user>";
   echo "Note: you may be asked to enter your password again";
   exit;
fi;

host=$1
db=$2
user=$3


psql -h $host -U $user -d $db -f ./sql/disable_revisioning.sql 


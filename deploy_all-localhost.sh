host=localhost 
db=bde_db 
user=postgres 
pass=nelson3106
year="2016"

echo "Updating $host:$db"

sh ./disable_revisioning.sh $host $db $user $pass
sh ./import_concordance.sh $host $db $user $pass $year
sh ./import_localities.sh $host $db $user $pass
sh ./import_meshblocks.sh $host $db $user $pass $year

host=tstassgeo01 
db=linz_db 
user=bmnelson
pass='Geolo08!'
year='2016'

echo "Updating $host:$db"

sh ./disable_revisioning.sh $host $db $user $pass
sh ./import_concordance.sh $host $db $user $pass $year
sh ./import_localities.sh $host $db $user $pass
sh ./import_meshblocks.sh $host $db $user $pass $year

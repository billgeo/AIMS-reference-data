if [ -z $5 ]; then
   echo "Usage: $0 <host> <db> <user> <pass> <year>";
   echo "Note: you may be asked to enter your password again";
   exit;
fi;

host=$1
db=$2
user=$3
pass=$4
year=$5

dir="/media/bmnelson/Data/Data/Stats_NZ";

echo "Starting concordance"

psql -h $host -U $user -d $db -f ./sql/create_concordance.sql \
\
&& \
\
iconv -f utf-8 -t utf-8 -c $dir/${year}_Areas_Table.txt > $dir/${year}_Areas_Table.csv \
\
&& \
\
ogr2ogr -f "PostgreSQL" PG:"host=$host user=$user dbname=$db password=$pass" \
           $dir/${year}_Areas_Table.csv \
           -nln admin_bdys.meshblock_concordance \
           -append \
           && echo 'Imported concordance' \
&& \
psql -h $host -U $user -d $db -c "COMMENT ON TABLE admin_bdys.meshblock_concordance IS '${year}';" ;

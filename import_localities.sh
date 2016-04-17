dir="/media/gisdata/NZ Localities";

if [ -z $4 ]; then
   echo "Usage: $0 <host> <db> <user> <pass>";
   echo "Note: you may be asked to enter your password again";
   exit;
fi;

host=$1
db=$2
user=$3
pass=$4


echo "Starting localities"

psql -h $host -U $user -d $db -f ./sql/create_nz_locality.sql \
&& \
ogr2ogr -f "PostgreSQL" PG:"host=$host user=$user dbname=$db password=$pass" \
    "$dir/nz_localities.shp" \
    -nln admin_bdys.nz_locality \
    -nlt PROMOTE_TO_MULTI \
    -sql '
    SELECT id, 
           parent_id, 
           suburb_4th, 
           suburb_3rd, 
           suburb_2nd, 
           suburb_1st, 
           type_order, 
           type, 
           city_id, 
           city_name, 
           has_addres, 
           start_date, 
           end_date, 
           major_id, 
           major_name
    from nz_localities' \
    -a_srs "EPSG:2193" -t_srs "EPSG:4167" \
    -append \
&& \
psql -h $host -U $user -d $db -f ./sql/setup_nz_locality.sql \
&& \
echo "Imported nz_localities";

echo "Starting suburb_aliases"

psql -h $host -U $user -d $db -f ./sql/create_suburb_alias.sql \
\
&& \
\
ogr2ogr -f "PostgreSQL" PG:"host=$host user=$user dbname=$db password=$pass" \
    "$dir/Suburb_Alias.csv" \
    -nln admin_bdys.suburb_alias \
    -sql "SELECT cast(LocalityID as integer) as locality_id, aliasname AS alias_name, aliastype as alias_type from Suburb_Alias" \
    -append \
&& echo "Imported suburb_aliases";

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

#TODO use this source (zipped FTP) \\prdassnas01\meshblock_custodianship\StatsNZ_Meshblock.shp
src="/media/bmnelson/Data/Data/Stats_NZ/${year} Digital Boundaries High Def Clipped/MB${year}_HD_Clipped.shp";

echo "Starting meshblocks"

#TODO: Use the stats WFS
# e.g. WFS:"https://datafinder.stats.govt.nz/services;key=$api_key/wfs/layer-8575?service=WFS"

psql -h $host -U $user -d $db -f ./sql/create_meshblock.sql \
&& \
ogr2ogr -f "PostgreSQL" PG:"host=$host user=$user dbname=$db password=$pass" \
           "$src" \
           -nln admin_bdys.meshblock \
           -nlt PROMOTE_TO_MULTI \
           -sql "SELECT MB${year} as code from MB${year}_HD_Clipped" \
           -a_srs "EPSG:2193" \
           -t_srs "EPSG:4167" \
           -append \
           && echo "Imported Meshblocks" \
&& \
psql -h $host -U $user -d $db -f ./sql/setup_meshblock.sql \
&& \
psql -h $host -U $user -d $db -c "COMMENT ON TABLE admin_bdys.meshblock IS '${year}';" ;


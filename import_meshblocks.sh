#!/bin/bash
if [ -z $4 ]; then
   echo "Usage: $0 <host> <db> <user> <pass>";
   exit;
fi;

host=$1
db=$2
user=$3
pass=$4

src="/media/meshblock/Stats_Meshblock_concordance_*.zip";
tmp_dir='/tmp/meshblock_tmp'

if [ ! -f $src ]; then
    echo "ERROR: Can not find file: $src"
    echo "Have you mounted the meshblock file server to '/media/meshblock'? See geodeticwiki for more info."
    exit
fi

echo "Starting meshblocks and concordance"

mkdir $tmp_dir

if [ ! -d $tmp_dir ]; then
    echo "ERROR: Could not create temp dir: $tmp_dir"
    exit
fi

unzip -d $tmp_dir $src;

mb_file="$tmp_dir/StatsNZ_Meshblock.shp"
con_file="$tmp_dir/Stats_Meshblock_concordance.csv"

if [ ! -f $mb_file ]; then
    echo "ERROR: Meshblock shapefile not found: $mb_file"
    exit
fi

if [ ! -f $con_file ]; then
    echo "ERROR: Meshblock concordance csv file not found: $con_file"
    exit
fi

# Import meshblocks and concordance
psql -h $host -U $user -d $db -f ./sql/create_meshblock.sql \
&& \
ogr2ogr -f "PostgreSQL" PG:"host=$host user=$user dbname=$db password=$pass" \
           "$mb_file" \
           -nln admin_bdys.meshblock \
           -nlt PROMOTE_TO_MULTI \
           -sql "SELECT MB_CODE as code from StatsNZ_Meshblock" \
           -append \
           && echo "Imported Meshblocks" \
&& \
psql -h $host -U $user -d $db -c "COMMENT ON TABLE admin_bdys.meshblock IS 'Imported on $(date);'" \
&& \
psql -h $host -U $user -d $db -f ./sql/create_concordance.sql \
&& \
ogr2ogr -f "PostgreSQL" PG:"host=$host user=$user dbname=$db password=$pass" \
           "$con_file" \
           -nln admin_bdys.meshblock_concordance \
           -append \
           -sql 'SELECT  meshblock, ta, region, "GED 2007" as ged_2007, "MED 2007" as med_2007, ged, med from Stats_Meshblock_concordance' \
           && echo 'Imported concordance' \
&& \
psql -h $host -U $user -d $db -c "COMMENT ON TABLE admin_bdys.meshblock_concordance IS 'Imported on $(date);'" \
&& \
psql -h $host -U $user -d $db -f ./sql/setup_meshblock.sql \

rm -R $tmp_dir

# AIMS-reference-data

Temporary tool to install meshblocks and locality boundaries into a database.

Will be superceded by https://github.com/linz/download_ta_bdys

## Prerequisites

- Linux/Unix
- Postgres
- POSTGIS
- Existing schema 'admin_bdys' 
- LINZ Table versioning extension
- File system mounts with the LINZ versions of the meshblock/localities deliveries
    * /media/gisdata/NZ Localities with 'Suburb_Alias.dbf' file and 'nz_localities.shp'
    * /media/meshblock/ with a file 'Stats_Meshblock_concordance_*.zip'

## Run

Drops the existing tables and recreates them and imports all data

~~~~
sh deploy.sh <host> <database> <username> <password>
~~~~

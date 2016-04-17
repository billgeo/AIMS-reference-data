alter table admin_bdys.meshblock add primary key (code); 

update admin_bdys.meshblock set shape = ST_Shift_Longitude(shape);

SELECT table_version.ver_enable_versioning('admin_bdys', 'meshblock');

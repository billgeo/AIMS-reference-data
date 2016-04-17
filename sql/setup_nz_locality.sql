alter table admin_bdys.nz_locality add primary key (id); 

update admin_bdys.nz_locality set shape = ST_Shift_Longitude(shape);

SELECT table_version.ver_enable_versioning('admin_bdys', 'nz_locality');

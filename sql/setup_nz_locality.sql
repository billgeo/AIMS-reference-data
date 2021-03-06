alter table admin_bdys.nz_locality add primary key (id);
create index on admin_bdys.suburb_alias (locality_id);

update admin_bdys.nz_locality set shape = ST_Shift_Longitude(shape) where ST_XMin(shape) < 0;

SELECT table_version.ver_enable_versioning('admin_bdys', 'nz_locality');

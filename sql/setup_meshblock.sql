alter table admin_bdys.meshblock add primary key (code);
alter table admin_bdys.meshblock_concordance add primary key (meshblock);

update admin_bdys.meshblock set shape = ST_Shift_Longitude(shape) where ST_XMin(shape) < 0;

SELECT table_version.ver_enable_versioning('admin_bdys', 'meshblock');
SELECT table_version.ver_enable_versioning('admin_bdys', 'meshblock_concordance');

DROP TABLE IF EXISTS admin_bdys.meshblock_concordance CASCADE;

CREATE TABLE admin_bdys.meshblock_concordance
(
  meshblock character varying,
  ta character varying,
  region character varying,
  ged_2007 character varying,
  med_2007 character varying,
  ged character varying,
  med character varying
);

ALTER TABLE admin_bdys.meshblock_concordance
  OWNER TO bde_dba;

GRANT ALL ON TABLE admin_bdys.meshblock_concordance TO bde_dba;
GRANT SELECT ON TABLE admin_bdys.meshblock_concordance TO roads_admin;
GRANT SELECT ON TABLE admin_bdys.meshblock_concordance TO roads_user;
GRANT SELECT ON TABLE admin_bdys.meshblock_concordance TO aims_admin;
GRANT SELECT ON TABLE admin_bdys.meshblock_concordance TO aims_user;


drop table if exists admin_bdys.suburb_alias cascade;

CREATE TABLE admin_bdys.suburb_alias
(
  locality_id integer,
  alias_name character varying,
  alias_type character varying
);

ALTER TABLE admin_bdys.suburb_alias
  OWNER TO bde_dba;

GRANT ALL ON TABLE admin_bdys.suburb_alias TO bde_dba;
GRANT SELECT ON TABLE admin_bdys.suburb_alias TO roads_admin;
GRANT SELECT ON TABLE admin_bdys.suburb_alias TO roads_user;
GRANT SELECT ON TABLE admin_bdys.suburb_alias TO aims_admin;
GRANT SELECT ON TABLE admin_bdys.suburb_alias TO aims_user;


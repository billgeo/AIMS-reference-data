drop table if exists admin_bdys.nz_locality cascade;

CREATE TABLE admin_bdys.nz_locality
(
  id integer,
  parent_id numeric(10,0),
  suburb_4th character varying(60),
  suburb_3rd character varying(60),
  suburb_2nd character varying(60),
  suburb_1st character varying(60),
  type_order numeric(10,0),
  type character varying(12),
  city_id numeric(10,0),
  city_name character varying(60),
  has_addres character varying(1),
  start_date date,
  end_date date,
  major_id numeric(10,0),
  major_name character varying(80),
  shape geometry(MultiPolygon,4167)
);

ALTER TABLE admin_bdys.nz_locality
  OWNER TO bde_dba;

GRANT ALL ON TABLE admin_bdys.nz_localities TO bde_dba;
GRANT SELECT ON TABLE admin_bdys.nz_localities TO roads_admin;
GRANT SELECT ON TABLE admin_bdys.nz_localities TO roads_user;
GRANT SELECT ON TABLE admin_bdys.nz_localities TO aims_admin;
GRANT SELECT ON TABLE admin_bdys.nz_localities TO aims_user;

CREATE INDEX nz_locality_shape_geom_idx
  ON admin_bdys.nz_locality
  USING gist
  (shape);


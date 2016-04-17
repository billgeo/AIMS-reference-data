DROP TABLE IF EXISTS admin_bdys.meshblock CASCADE;

CREATE TABLE admin_bdys.meshblock
(
  shape geometry(MultiPolygon,4167),
  code character varying(10)
);

ALTER TABLE admin_bdys.meshblock
  OWNER TO bde_dba;

GRANT ALL ON TABLE admin_bdys.meshblock TO bde_dba;
GRANT SELECT ON TABLE admin_bdys.meshblock TO public;

CREATE INDEX meshblock_shape_geom_idx
  ON admin_bdys.meshblock
  USING gist
  (shape);



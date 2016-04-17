DROP TABLE IF EXISTS admin_bdys.meshblock_concordance CASCADE;

CREATE TABLE admin_bdys.meshblock_concordance
(
  mb2001_code character varying,
  mb2006_code character varying,
  mb2010_code character varying,
  mb2011_code character varying,
  mb2013_code character varying,
  mb2014_code character varying,
  mb2015_code character varying,
  au2015_code character varying,
  au2015_label character varying,
  ua2015_code character varying,
  ua2015_label character varying,
  ta2010_code character varying,
  ta2010_label character varying,
  ta2015_code character varying,
  ta2015_label character varying,
  ward2015_code character varying,
  ward2015_label character varying,
  cb2015_code character varying,
  cb2015_label character varying,
  regc2015_code character varying,
  regc2015_label character varying,
  con2015_code character varying,
  con2015_label character varying,
  mcon2015_code character varying,
  mcon2015_label character varying,
  ged2014_code character varying,
  ged2014_label character varying,
  med2014_code character varying,
  med2014_label character varying,
  dhb_code character varying,
  dhb_label character varying,
  dhbcon_code character varying,
  dhbcon_label character varying,
  hdom2006_code character varying
);

ALTER TABLE admin_bdys.meshblock_concordance
  OWNER TO bde_dba;

GRANT ALL ON TABLE admin_bdys.meshblock_concordance TO bde_dba;
GRANT SELECT ON TABLE admin_bdys.meshblock_concordance TO public;

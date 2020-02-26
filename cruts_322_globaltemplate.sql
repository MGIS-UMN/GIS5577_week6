BEGIN;

DROP table if exists cruts_322_globaltemplate;

create table cruts_322_globaltemplate
(
pixel_id integer,
geom_info text
);

\copy cruts_322_globaltemplate from 'C:\work\GIS5577_week6\cruts_322_globaltemplate.csv' WITH CSV HEADER;

ALTER TABLE cruts_322_globaltemplate ADD geom geometry;

UPDATE cruts_322_globaltemplate
SET geom = ST_GeomFromText(geom_info, 4326);

GRANT ALL ON cruts_322_globaltemplate TO students;

END;
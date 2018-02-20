drop table gis5577.cruts_322_globaltemplate;

create table gis5577.cruts_322_globaltemplate
(
pixel_id integer,
geom_info text
);

copy gis5577.cruts_322_globaltemplate from 'C:\git\GIS5577_spring_2018\cruts_322_globaltemplate.csv' WITH CSV HEADER;

ALTER TABLE gis5577.cruts_322_globaltemplate ADD geom geometry;

UPDATE gis5577.cruts_322_globaltemplate
SET geom = ST_GeomFromText(geom_info, 4326)


BEGIN;

DROP TABLE IF EXISTS cruts_322_us_climate;

create table cruts_322_us_climate (
id bigint,
pixel_id bigint,
sample_date date, 
longitude double precision, 
latitude double precision, 
cld float, 
dtr float, 
tmn float, 
pet float, 
tmx float, 
tmp float, 
wet float, 
frs float, 
pre float, 
vap float
);

\copy cruts_322_us_climate from 'F:\git\GIS5577\GIS5577_week6\cruts_322_us_data_2005_2013.csv' WITH CSV HEADER;

ALTER TABLE cruts_322_us_climate ADD geom geometry;

UPDATE cruts_322_us_climate
SET geom = ST_GeomFromText('POINT(' || longitude || ' ' || latitude || ')', 4326);

END;
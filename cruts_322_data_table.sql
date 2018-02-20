create table gis5577.cruts_322_climate (
id bigint,
pixel_id bigint,
time date, 
long double precision, 
lat double precision, 
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

drop table gis5577.cruts_322_climate;

copy gis5577.cruts_322_climate from 'C:\git\GIS5577_spring_2018\cruts_322_climate.csv' WITH CSV HEADER;
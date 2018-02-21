#GIS 55777 Week 6
This is the repository for Week 6 class exercises

The purpose of this weeks class is to practice conducting spatial queries.
Begin by loading the following datasets, which are all in WGS84, SRID 4326
## Datasets can be found in the shapefile directory
1. States 
Cartographic boundaries of the US States
1. US Cities
Point dataset of major us cities
1. US Counties
Polygon dataset of all us counties
1. US Roads
Polyline dataset of major us roads

# Climate Datasets

## CRUTS 3.22
This a modeled climate dataset that we are using.
1. To use the CRUTS dataset you will need to load 2 different tables
1. Table1 is the cruts_global_template
1. Table2 is the cruts_322_us_climate
1. Each of these statements as a specific sql file that will aide in the loading process. If you want to execute these first open them in a text editor and modfiy the file paths appropriately and then *SAVE*
1.1. create_cruts_322.sql - Will load the monthly pixel values
1.1. cruts_322_globaltemplate.sql - Will load the global template
1. Each can be executed using following -f flag when connecting to PostgreSQL
psql -h  -d x5000 -U -x5000 -f create_cruts_322.sql

## Using CRUTS 3.22
The CRUTS dataset (cruts_322_us_climate) is a large denormalized table that provides 1 record for every pixel for every observance. The United States is covered with over 67,000 observaations, which can be found in the cruts_global_template table.

## CRUTS 3.22 Dataset table
>  id bigint,
>  pixel_id bigint,
>  sample_date date,
>  longitude double precision,
>  latitude double precision,
>  cld double precision,
>  dtr double precision,
>  tmn double precision,
>  pet double precision,
>  tmx double precision,
>  tmp double precision,
>  wet double precision,
>  frs double precision,
>  pre double precision,
>  vap double precision,

## CRUTS Global Template table
>  pixel_id bigint,
>  geom_info text,
>  geom geometry

## Joining
Join the two tables together using the key pixel_id in both tables. Remember the CRUTS dataset table has a value for pixel_id for each month in the year. 

### Question: Identify locations where the max temperature was above 20C in 2008. 
SELECT t.pixel_id, t.geom, c.tmx, sample_date
from cruts_322_globaltemplate t
INNER JOIN cruts_322_us_climate c ON (t.pixel_id = c.pixel_id)WHERE c.tmx > 20 AND
date_part('year', sample_date) = 2008

*If you map this you will get multiple observations per location. You might need to reduce this and rephrase the question to be.*

### Question: Identify locations wher the max temperature was above 20C in June of 2008
SELECT t.pixel_id, t.geom, c.tmx, sample_date
from cruts_322_globaltemplate t
INNER JOIN cruts_322_us_climate c ON (t.pixel_id = c.pixel_id)
WHERE c.tmx > 20 AND
date_part('year', sample_date) = 2008 AND date_part('month', sample_date) = 6




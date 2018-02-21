DROP TABLE IF EXISTS census_tract_2010_population;

create table census_tract_2010_population (
gis_join_match_code text,
state_name text,
state_code integer,
county_name text,
county_code integer,
census_tract_code text,
total_population bigint,
male_population bigint,
female_population bigint
);

\copy census_tract_2010_population from 'C:\git\GIS5577_spring_2018\GIS5577_week6\census_tract_2010_population.csv' WITH CSV HEADER;

GRANT ALL ON census_tract_2010_population TO students;
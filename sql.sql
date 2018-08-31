﻿CREATE TABLE public.chicago_taxi_trips_2016
(
  taxi_id integer,
  trip_start_timestamp timestamp without time zone,
  trip_end_timestamp timestamp without time zone,
  trip_seconds integer,
  trip_miles double precision,
  pickup_census_tract integer,
  dropoff_census_tract integer,
  pickup_community_area integer,
  dropoff_community_area integer,
  fare double precision,
  tips double precision,
  tolls double precision,
  extras double precision,
  trip_total double precision,
  payment_type character varying(250),
  company integer,
  pickup_latitude integer,
  pickup_longitude integer,
  dropoff_latitude integer,
  dropoff_longitude integer
)

Select distinct chicago_taxi_trips_2016.taxi_id into taxi_idss from chicago_taxi_trips_2016

Select distinct chicago_taxi_trips_2016.company into company from chicago_taxi_trips_2016

Select distinct chicago_taxi_trips_2016.payment_type into payment_type from chicago_taxi_trips_2016

DELETE FROM payment_type WHERE payment_type IS NULL;

DELETE FROM taxi_idss WHERE taxi_id IS NULL;

DELETE FROM company WHERE company IS NULL;

ALTER TABLE taxi_idss ADD PRIMARY KEY (taxi_id)

ALTER TABLE company ADD PRIMARY KEY (company)

ALTER TABLE payment_type ADD PRIMARY KEY (payment_type);

Alter table payment_type add column id_type_payment BIGSERIAL PRIMARY KEY;

ALTER TABLE payment_type ALTER COLUMN  id_type_payment SET DATA TYPE varchar(250); 

ALTER TABLE chicago_taxi_trips_2016
DROP CONSTRAINT fk_payment_id;

ALTER TABLE payment_type ALTER COLUMN  id_type_payment SET DATA TYPE INTEGER USING id_type_payment::integer;

ALTER TABLE chicago_taxi_trips_2016 ALTER COLUMN  payment_type SET DATA TYPE INTEGER USING payment_type::integer;

-----
select * 
from payment_type inner join chicago_taxi_trips_2016 on payment_type.id_type_payment = chicago_taxi_trips_2016.payment_type
where payment_type ='cash'
-----

ALTER TABLE chicago_taxi_trips_2016 
   ADD CONSTRAINT fk_payment_id
   FOREIGN KEY (payment_type) 
   REFERENCES payment_type(id_type_payment);

ALTER TABLE chicago_taxi_trips_2016 
   ADD CONSTRAINT fk_company
   FOREIGN KEY (company) 
   REFERENCES company(company);


ALTER TABLE chicago_taxi_trips_2016 
   ADD CONSTRAINT fk_taxi_id
   FOREIGN KEY (taxi_id) 
   REFERENCES taxi_idss(taxi_id);

select *
from chicago_taxi_trips_2016
where taxi_id = 7;

ALTER TABLE chicago_taxi_trips_2016
DROP CONSTRAINT fk_taxi_id;

DROP TABLE taxi_idss;


ALTER TABLE chicago_taxi_trips_2016 DROP CONSTRAINT fk_payment_id;

UPDATE public.chicago_taxi_trips_2016
   SET payment_type='1'
 WHERE payment_type='Prcard';

 UPDATE public.chicago_taxi_trips_2016
   SET payment_type='2'
 WHERE payment_type='Way2ride';

  UPDATE public.chicago_taxi_trips_2016
   SET payment_type='3'
 WHERE payment_type='Cash';

   UPDATE public.chicago_taxi_trips_2016
   SET payment_type='4'
 WHERE payment_type='Dispute';

    UPDATE public.chicago_taxi_trips_2016
   SET payment_type='5'
 WHERE payment_type='Unknown';

     UPDATE public.chicago_taxi_trips_2016
   SET payment_type='6'
 WHERE payment_type='Credit Card';

    UPDATE public.chicago_taxi_trips_2016
   SET payment_type='7'
 WHERE payment_type='No Charge';

     UPDATE public.chicago_taxi_trips_2016
   SET payment_type='8'
 WHERE payment_type='Pcard';

Alter table company add column company_name varchar(250);
Alter table company add column company_phone integer;
Alter table company add column company_address varchar(250);
Alter table company add column comany_zip integer;

UPDATE public.company
   SET company_name='5 STAR TAXI ASSOCIATION INC',company_phone=77386699, company_address='9696 W. FOSTER AVE',comany_zip=60656
 WHERE company=2;

UPDATE public.company
   SET company_name='24 SEVEN TAXI ASSOCIATION , INC ',company_phone=77387882, company_address='5606 N. WESTERN AV ',
   comany_zip=60659
 WHERE company=3; 

UPDATE public.company
   SET company_name='ACE CAB ASSOCIATION INC',company_phone=73127338, company_address='2738 W. FULTON STREET',
   comany_zip=60612
 WHERE company=5;  

UPDATE public.company
   SET company_name='AMERICAN UNITED TAXI AFFIL INC ',company_phone=31288131, company_address='3351 W. ADDISON ST',
   comany_zip=60618
 WHERE company=6;

 UPDATE public.company
   SET company_name='BLUE DIAMOND TAXI ASSOC, INC',company_phone=31288131, company_address='3351 W. ADDISION ST',
   comany_zip=60607
 WHERE company=7;  

  UPDATE public.company
   SET company_name='BLUE RIBBON ASSN INC',company_phone=77327941, company_address='4020 W. GLENLAKE AVE',
   comany_zip=60646
 WHERE company=8;

   UPDATE public.company
   SET company_name='CHECKER TAXI ASSOCIATION CO.',company_phone=31288131, company_address='3351 W. ADDISON ST',
   comany_zip=60618
 WHERE company=9; 

   UPDATE public.company
   SET company_name='CHICAGO CARRIAGE CAB',company_phone=31279111, company_address='2617 S. WABASH AV',
   comany_zip=60616
 WHERE company=10;

   UPDATE public.company
   SET company_name='CHOICE TAXI ASSOCIATION INC',company_phone=77389503, company_address='6550 N. CLARK ST',
   comany_zip=60626
 WHERE company=12;

    UPDATE public.company
   SET company_name='CITY SERVICE TAXI ASSOCIATION, INC',company_phone=77390700, company_address='2601 W. PETERSON AV',
   comany_zip=60659
 WHERE company=14;

    UPDATE public.company
   SET company_name='FLASH CAB CO',company_phone=77386993, company_address='9696 W. FOSTER AVE',
   comany_zip=60656
 WHERE company=21;

    UPDATE public.company
   SET company_name='GLOBE TAXI ASSOCIATION, INC ',company_phone=77725620, company_address='4118 W. LAWRENCE AVE',
   comany_zip=60630
 WHERE company=26;

    UPDATE public.company
   SET company_name='GOLD COAST AFFILIATION',company_phone=77327163, company_address='4542 N. BROADWAY, SUITE 328',
   comany_zip=60640
 WHERE company=17;

    UPDATE public.company
   SET company_name='KING DRIVE CAB AFFILIATION INC',company_phone=77348880, company_address='8000 S. M.L.KING DR',
   comany_zip=60619
 WHERE company=19;

    UPDATE public.company
   SET company_name='KOAM TAXI ASSOCIATION',company_phone=77397335, company_address='4020 W. GLENLAKE AVE',
   comany_zip=60646
 WHERE company=20;

     UPDATE public.company
   SET company_name='METRO JET CAB ASSOCIATION, INC',company_phone=77345669, company_address='4554 N. BROADWAY AV, SUITE # 314',
   comany_zip=60640
 WHERE company=28;

   UPDATE public.company
   SET company_name='NOVA TAXI AFFILIATION, LLC',company_phone=31266664, company_address='220 N. LAFLIN STREET',
   comany_zip=60607
 WHERE company=31;

    UPDATE public.company
   SET company_name='PEACE TAXI ASSOC INC',company_phone=77326255, company_address='2800 W. PETERSON, SUITE 202',
   comany_zip=60642
 WHERE company=32;

    UPDATE public.company
   SET company_name='ROYAL 3 CCC CHICAGO TAXI ASSOC, INC',company_phone=31279118, company_address='2617 S. WABASH AV',
   comany_zip=60616
 WHERE company=35;

    UPDATE public.company
   SET company_name='SERVICE TAXI ASSOCIATION INC',company_phone=77262216, company_address='5765 N. LINCOLN AVENUE, SUITE #22',
   comany_zip=60659
 WHERE company=37;

    UPDATE public.company
   SET company_name='SUN TAXI ASSOCIATION INC',company_phone=77373638, company_address='4626 W. CORNELIA AV',
   comany_zip=60641
 WHERE company=38;

     UPDATE public.company
   SET company_name='TAXI TOWN AFFILIATION, LLC',company_phone=77350649, company_address='2945 W PETERSON, SUITE 103',
   comany_zip=60659
 WHERE company=42;

     UPDATE public.company
   SET company_name='TOP CAB CORP',company_phone=77350649, company_address='2945 W PETERSON, SUITE 103',
   comany_zip=60659
 WHERE company=43;

     UPDATE public.company
   SET company_name='YELLOW CAB ASSOCIATION CO.',company_phone=31288114, company_address='3351 W. ADDISON ST',
   comany_zip=60618
 WHERE company=44;

UPDATE public.company
SET company_name='RED CAB ASSOCIATION CO.',company_phone=31288534, company_address='3351 W. ADDISON ST STREET',
comany_zip=60612
 WHERE company=15;
------------------------------------------------------------------------------------------------------------------
UPDATE public.company
SET company_name='QUICK	RIDE CORP',company_phone=22330005, company_address='88 Hester St
New York, NY 10002
b/t Allen St & Eldridge St 
Chinatown, Lower East Side',
comany_zip=67612
 WHERE company=51;

UPDATE public.company
SET company_name='LUXURY NY LIMO',company_phone=22330505, company_address='88 Hester St
New York, NY 10002
b/t Allen St & Eldridge St',
comany_zip=67611
 WHERE company=55;

UPDATE public.company
SET company_name='GO GREEN RIDE',company_phone=22790005, company_address='b/t Allen St & Eldridge St 
Chinatown, Lower East Side',
comany_zip=67610
 WHERE company=57;

UPDATE public.company
SET company_name='QUICK	RIDE CORP',company_phone=22330005, company_address='2945 W PETERSON, SUITE 103',
comany_zip=97612
 WHERE company=62;
 
UPDATE public.company
SET company_name='YELLOW CAB NY',company_phone=53330005, company_address='New York, NY 10002
b/t Allen St & Eldridge St 
Chinatown, Lower East Side',
comany_zip=67617
 WHERE company=63;

UPDATE public.company
SET company_name='HARLEM CAR SERVICE',company_phone=21330005, company_address='HARLEM, NY 10002
b/t Allen S',
comany_zip=37612
 WHERE company=65;


UPDATE public.company
SET company_name='PARSON CAR SERVICE',company_phone=22336305, company_address='Chinatown, Lower East Side',
comany_zip=67612
WHERE company=68;


UPDATE public.company
SET company_name='CLOVE LAKE CAR',company_phone=18442001, company_address='1113 Victory Blvd
Staten Island, NY 10301',
comany_zip=6712
WHERE company=72;

UPDATE public.company
SET company_name='PREMIERE CAR SERVOCE',company_phone=22336305, company_address='EAST FLATBUSH',
comany_zip=67614
WHERE company=73;

UPDATE public.company
SET company_name='NEW GOLDEN CAR SERVICE',company_phone=22377305, company_address='LOWER EAST SIDE',
comany_zip=67612
WHERE company=74;

UPDATE public.company
SET company_name='BLACK PEARL',company_phone=11336305, company_address='CLINTON HILL, CROWN HEIGHTS',
comany_zip=677732
WHERE company=75;

UPDATE public.company
SET company_name='CROSS BAY CAR SERVICE',company_phone=23641305, company_address='OZONE PARK 10512',
comany_zip=97612
WHERE company=76;

UPDATE public.company
SET company_name='SUPER TAXI',company_phone=62471305, company_address='SOUTH ORANGE 10512',
comany_zip=97645
WHERE company=79;

UPDATE public.company
SET company_name='EVERYWHERE CAR SERVICE',company_phone=23646705, company_address='HILL SIDE AV JAMAICA 11432',
comany_zip=94612
WHERE company=80;

UPDATE public.company
SET company_name='PRECISON NY CHAUFFEUR AIRPORT SERVICE',company_phone=23641785, company_address='AIRPORT AV 10512',
comany_zip=9712
WHERE company=82;

UPDATE public.company
SET company_name='GOOD LUCK CAR SERVICE',company_phone=23641105, company_address='LOWER EAST SUDE 10568',
comany_zip=976158
WHERE company=85;

UPDATE public.company
SET company_name='FREEDOM LIMO AND CAR SERVICE',company_phone=11641305, company_address='BEDFORD STUYVESAND 15876',
comany_zip=97691
WHERE company=89;

UPDATE public.company
SET company_name='NEW BED CAR SERVICE',company_phone=20041305, company_address='CLINTON HILL BEDFORT STUYVESAND 10512',
comany_zip=97611
WHERE company=90;

UPDATE public.company
SET company_name='ECUA CAR SERVICE',company_phone=23791305, company_address='WEST SIDE AV PARK 10512',
comany_zip=97617
WHERE company=91;


UPDATE public.company
SET company_name='BUDGET TAXI',company_phone=23699305, company_address='HOBOKEN NJ 1358',
comany_zip=97616
WHERE company=92;

UPDATE public.company
SET company_name='KID CAR LA',company_phone=23639305, company_address='WESTCHESTER 1358',
comany_zip=97614
WHERE company=97;

UPDATE public.company
SET company_name='PRESTIGE CAR',company_phone=41699305, company_address='OCEAN DRIVE AVENUE 1253',
comany_zip=9761
WHERE company=99;

UPDATE public.company
SET company_name='ROUTE 22 LIMOUSINE CORP',company_phone=23693135, company_address='DYKE HEIGHTS 4661',
comany_zip=97616
WHERE company=101;

UPDATE public.company
SET company_name='COZY RIDE',company_phone=16799305, company_address='DOWNTOWN FLUSHING 1576',
comany_zip=97641
WHERE company=102;

UPDATE public.company
SET company_name='NORMA LIMO AND TAXI SERVICE',company_phone=27999305, company_address='HOBOKEN NJ 1358',
comany_zip=97632
WHERE company=103;

UPDATE public.company
SET company_name='METROLINE CAR SERVICE',company_phone=23699135, company_address='WALL STREET CENTER AV 156',
comany_zip=97648
WHERE company=106;

UPDATE public.company
SET company_name='SEAMAN RADIO DISPATCHER',company_phone=23622305, company_address='TIME SQUARE 1358',
comany_zip=95816
WHERE company=107;

UPDATE public.company
SET company_name='COUNTY TRIP SERVICE',company_phone=29799305, company_address='MADDISON GARDEN AVENUE 1358',
comany_zip=97421
WHERE company=109;

UPDATE public.company
SET company_name='BAYONNE CITY YELLOW CAR',company_phone=23686305, company_address='KENNEDY BLVD 07002',
comany_zip=97317
WHERE company=111;

UPDATE public.company
SET company_name='JERSEY TAXI CAB',company_phone=86579305, company_address='1008 MANHATTAN AVENUE BROOKLYN',
comany_zip=787616
WHERE company=115;

UPDATE public.company
SET company_name='HUANG HOU CAR SERVICE',company_phone=73699305, company_address='CHINATOWN NJ 1358',
comany_zip=97423
WHERE company=118;

UPDATE public.company
SET company_name='ABATAR CAR SERVICE',company_phone=23691305, company_address='HABITAT OHEE AVENUE 29',
comany_zip=87736
WHERE company=119; 

--consulta 1

 SELECT payment_type,trip_seconds,trip_total
 FROM chicago_taxi_trips_2016
 WHERE taxi_id = 8191;
 
CREATE INDEX hash_taxi_id ON chicago_taxi_trips_2016 USING HASH(taxi_id);
 
Explain
 SELECT payment_type,trip_seconds,trip_total
 FROM chicago_taxi_trips_2016
 WHERE taxi_id = 8191;
 
DROP INDEX IF EXISTS hash_taxi_id;
 
CREATE INDEX hash_taxi_id ON chicago_taxi_trips_2016 USING BTREE(taxi_id);

Explain
 SELECT payment_type,trip_seconds,trip_total
 FROM chicago_taxi_trips_2016
 WHERE taxi_id = 8191;


--consulta 2

 SELECT taxi_id,payment_type,trip_total
 FROM chicago_taxi_trips_2016
 WHERE trip_total > 15;


CREATE INDEX btree_trip_total ON chicago_taxi_trips_2016 USING BTREE(trip_total);

 EXPLAIN
 SELECT taxi_id,payment_type,trip_total
 FROM chicago_taxi_trips_2016
 WHERE trip_total > 15; 

 DROP INDEX IF EXISTS btree_trip_total;

CREATE INDEX hash_trip_total ON chicago_taxi_trips_2016 USING HASH(trip_total);

 EXPLAIN
 SELECT taxi_id,payment_type,trip_total
 FROM chicago_taxi_trips_2016
 WHERE trip_total > 15;

 DROP INDEX IF EXISTS hash_trip_total;


 --consulta 3

 SELECT company.company_name,chicago_taxi_trips_2016.taxi_id,company.company_address
 FROM company,chicago_taxi_trips_2016
 WHERE company.company = chicago_taxi_trips_2016.company;

 CREATE INDEX hash_company ON company USING HASH(company);

 EXPLAIN
 SELECT company.company_name,chicago_taxi_trips_2016.taxi_id,company.company_address
 FROM company,chicago_taxi_trips_2016
 WHERE company.company = chicago_taxi_trips_2016.company; 

 DROP INDEX IF EXISTS hash_company;

 CREATE INDEX hash_company ON chicago_taxi_trips_2016 USING HASH(company);

 EXPLAIN
 SELECT company.company_name,chicago_taxi_trips_2016.taxi_id,company.company_address
 FROM company,chicago_taxi_trips_2016
 WHERE company.company = chicago_taxi_trips_2016.company;


--consulta 4

SELECT taxi_id, COUNT(*)
FROM chicago_taxi_trips_2016
GROUP BY taxi_id;

 CREATE INDEX hash_taxi_id ON chicago_taxi_trips_2016 USING HASH(taxi_id);

EXPLAIN
SELECT taxi_id, COUNT(*)
FROM chicago_taxi_trips_2016
GROUP BY taxi_id;

DROP INDEX IF EXISTS hash_taxi_id;



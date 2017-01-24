listings = LOAD '/mydata/class2/realestate.txt' USING PigStorage(',')
as
(listing_id:int, date_listed:chararray, list_price:float,
sq_feet:int, address:chararray);

listings = FOREACH listings GENERATE listing_id, ToDate(date_listed, 'YYYY-MM-dd') AS date_listed, list_price, sq_feet, address;

--DUMP listings;

bighomes = FILTER listings BY sq_feet >= 2000;

bighomes_dateprice = FOREACH bighomes GENERATE
listing_id, date_listed, list_price;

DUMP bighomes_dateprice;
STORE bighomes_dateprice INTO '/mydata/class2/homedata';



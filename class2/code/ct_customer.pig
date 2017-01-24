customer = LOAD '/userdata/customers' USING PigStorage(',') AS
(cust_id:int,fname:chararray,lname:chararray,address:chararray,city:chararray,state:chararray,zipcode:chararray);

ct_customer = FILTER customer BY state=='CT';

DUMP ct_customer;

STORE ct_customer INTO '/mydata.class2/customers';

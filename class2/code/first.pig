data = LOAD '/mydata/class2/sample1.txt' USING PigStorage('|') AS
(product_id:chararray,Title:chararray,price:float,user_id:chararray,profile_name:chararray,helpfulness:chararray,score:float,time:long,summary:chararray);

data = FILTER data BY score <3.0;

data = FOREACH data GENERATE score,Title,price,profile_name,helpfulness,TRIM(UPPER(summary)) AS summary;

DUMP data;

STORE data INTO '/mydata/class2/arts_list_1';


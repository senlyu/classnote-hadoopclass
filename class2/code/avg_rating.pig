reviews = LOAD '/mydata/class2/arts_list.txt' USING PigStorage('|') AS
(product_id:chararray,Title:chararray,price:float,user_id:chararray,profile_name:chararray,helpfulness:chararray,score:float,time:long,summary:chararray);
byproduct = GROUP reviews BY Title;
DESCRIBE byproduct;
byproduct = LIMIT byproduct 5;
dump byproduct;
tenbyproduct = GROUP reviews BY product_id;

tenbyproduct = FILTER tenbyproduct BY COUNT(reviews.summary)>=10;

list = FOREACH tenbyproduct GENERATE
         group, AVG(reviews.score) AS avgscore, MIN(reviews.price), MAX(reviews.score), MAX(reviews.Title),  COUNT(reviews.summary);

list = ORDER list BY avgscore DESC;

list = LIMIT list 20;

dump list;








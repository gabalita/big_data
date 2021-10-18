'Step 1. Filter on reviews with +20 total_votes reviews
(more likely to be helpful)'
SELECT *
INTO vine_table_20_plus
FROM vine_table
WHERE total_votes > 20;
SELECT * FROM vine_table_20_plus;

'Step 2. Filter the new DataFrame or table created in Step 1
and create a new DataFrame or table to retrieve all the
rows where the number of helpful_votes divided by total_votes
is equal to or greater than 50%.'

SELECT *,
	CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) AS "Helpful:Total Votes"
INTO vine_helpful_total_ratio
FROM vine_table_20_plus
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >= 0.5;

SELECT * FROM vine_helpful_total_ratio LIMIT 20;


'Step 3: Retrieve all rows where review was apart of Vine'
SELECT *
FROM vine_helpful_total_ratio
WHERE vine='Y';
'No rows were returned'

'Check to see if there are even "Y" rows in the original vine_table'
SELECT * FROM vine_table
WHERE vine='Y' LIMIT 20;
'There are only 2 rows in this dataset where the review is apart of Vine'
'R2NKNL4WXWIWBG, 4,3,3,Y,Y <<< this one will NOT show up though b/c it doesnt have more than 20 votes'
'RAIG9ZQDMBF5P,5,3,6,Y,N'


'Step 4: Retrieve all rows where review was not apart of Vine'
SELECT *
INTO vine_N
FROM vine_helpful_total_ratio
WHERE vine='N';
SELECT * FROM vine_N;

'Step 5. Determine the total number of reviews, the number of 5-star reviews,
and the percentage of 5-star reviews for the two types of review (paid vs unpaid).'
SELECT * FROM vine_table LIMIT 20;

DROP TABLE vine_totalreviews_types;
DROP TABLE vine_fivestars_types;


'Get total number of reviews for 2 types'
SELECT vine, COUNT(review_id) AS "totalreviews"
INTO vine_totalreviews_types
FROM vine_table
GROUP BY vine;
'N: 3105513'
'Y: 2'
'Null: 5'

'Get number of 5 star reviews for 2 types'
SELECT vine, COUNT(vine) AS "fivestars"
INTO vine_fivestars_types
FROM vine_table
WHERE star_rating = 5
GROUP BY vine;

SELECT * FROM vine_totalreviews_types;
SELECT * FROM vine_fivestars_types;

'Create the table'
CREATE TABLE vine_breakdown (
  vine TEXT PRIMARY KEY,
  totalreviews INTEGER,
  fivestars INTEGER);

'Insert the data into the table'
INSERT INTO vine_breakdown
SELECT vtr.vine, vtr.totalreviews, vfr.fivestars
FROM vine_totalreviews_types as vtr 
INNER JOIN vine_fivestars_types as vfr
ON vtr.vine=vfr.vine;

'Check table'
SELECT * FROM vine_breakdown;

'Add percentage column'
SELECT *, CAST(totalreviews AS FLOAT)/CAST(fivestars AS FLOAT) AS "percentfivestar"
INTO vine_breakdown_final
FROM vine_breakdown;

'Check Step 5 table'
SELECT * FROM vine_breakdown_final;







'Practice Functions'
SELECT * FROM customers_table LIMIT 20;

SELECT customer_id FROM customers_table
LIMIT 20;

'product_id, product_title'
SELECT * FROM products_table LIMIT 20;
SELECT * FROM customers_table LIMIT 20;

SELECT customer_id FROM customers_table
LIMIT 20;

'product_id, product_title'
SELECT * FROM products_table LIMIT 20;

'review_id, customer_id, product_id'
'product_parent, review_date'
SELECT * FROM review_id_table LIMIT 20;

'review_id, star_rating, helpful_votes'
'total_votes,vine, verified_purchase'
SELECT * FROM vine_table LIMIT 20;


'Find average = 49.6'
SELECT AVG(total_votes) FROM vine_table
WHERE total_votes > 20;

'Find count of 20+ votes table' '472,014'
SELECT count(*) FROM vine_table
WHERE total_votes > 20;

'Get the count'
SELECT COUNT(DISTINCT(total_votes)) FROM vine_table; '1024'
SELECT SUM(total_votes) FROM vine_table; '38508631'

'Group by product_parent, and count the number of products in each grouping and sort'
SELECT product_parent, count(product_parent) FROM review_id_table
GROUP BY product_parent
ORDER BY COUNT(product_parent) DESC;

SELECT review_id, helpful_votes
FROM vine_table
ORDER BY helpful_votes DESC
LIMIT 20;




'review_id, customer_id, product_id'
'product_parent, review_date'
SELECT * FROM review_id_table LIMIT 20;

'review_id, star_rating, helpful_votes'
'total_votes,vine, verified_purchase'
SELECT * FROM vine_table LIMIT 20;


'1. Filter on reviews with +20 total_votes reviews
(more likely to be helpful)'
SELECT *
INTO vine_table_20_plus
FROM vine_table
WHERE total_votes > 20;
SELECT * FROM vine_table_20_plus;

'2. Filter the new DataFrame or table created in Step 1
and create a new DataFrame or table to retrieve all the
rows where the number of helpful_votes divided by total_votes
is equal to or greater than 50%.'

SELECT *,
	CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) AS "Helpful:Total Votes"
INTO vine_helpful_total_ratio
FROM vine_table_20_plus
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >= 0.5;

SELECT * FROM vine_helpful_total_ratio;

SELECT *
FROM vine_helpful_total_ratio
WHERE vine=='Y';



'Practice Functions'
'Find average = 49.6'
SELECT AVG(total_votes) FROM vine_table
WHERE total_votes > 20;

'Find count of 20+ votes table' '472,014'
SELECT count(*) FROM vine_table
WHERE total_votes > 20;

'Get the count'
SELECT COUNT(DISTINCT(total_votes)) FROM vine_table; '1024'
SELECT SUM(total_votes) FROM vine_table; '38508631'

'Group by product_parent, and count the number of products in each grouping and sort'
SELECT product_parent, count(product_parent) FROM review_id_table
GROUP BY product_parent
ORDER BY COUNT(product_parent) DESC;

SELECT review_id, helpful_votes
FROM vine_table
ORDER BY helpful_votes DESC
LIMIT 20;




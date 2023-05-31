-- convert order_date and ship_date columns to date type
ALTER TABLE SALES_DB
ALTER COLUMN ORDER_DATE TYPE date USING TO_DATE(ORDER_DATE, 'DD MM YYYY');

ALTER TABLE SALES_DB
ALTER COLUMN SHIP_DATE TYPE date USING TO_DATE(SHIP_DATE, 'DD MM YYYY');


-- Write a SQL query that would show us the frequency of respondents of each country (country), market (market), and region (region) group 
-- as well as the average and median profit (profit) of those groups of the people who ordered office supplies (cetagory).
SELECT country, market, region,
       COUNT(*) AS frequency,
       AVG(profit) AS average_profit,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY profit) AS median_profit
FROM sales_db
WHERE category = 'Office Supplies'
GROUP BY country, market, region;



--Write a SQL query to count the number of respondents who mentioned storage as one of their top three subcategory (subcategory), 
--the number of respondents who mentioned Furniture, and the number of respondents who mentioned Chairs.
SELECT 
    COUNT(CASE WHEN sub_category = 'Storage' THEN 1 END) AS "Storage",
	COUNT(CASE WHEN sub_category = 'Furniture' THEN 1 END) AS Furniture,
    COUNT(CASE WHEN sub_category = 'Chairs' THEN 1 END) AS Chairs    
FROM sales_db;


-- Find all transactions in 2014
SELECT *
FROM SALES_DB
WHERE YEAR = '2014';

-- find the transactions having the highest sales
SELECT ORDER_ID,
	CUSTOMER_NAME,
	PRODUCT_ID,
	PRODUCT_NAME,
	SALES_AMOUNT
FROM SALES_AMOUNT
WHERE SALES =
		(SELECT MAX(SALES)
			FROM SALES);

-- Find the number of transactions made from New Zealand
SELECT COUNT(*)
FROM SALES_DB
WHERE COUNTRY = 'New Zealand';

-- List all transactions made in New Zealand
SELECT *
FROM SALES_DB
WHERE COUNTRY = 'New Zealand';

-- Average of all sales

SELECT AVG(SALES_AMOUNT)
FROM SALES_DB;

-- Total amount of sales in 2012

SELECT SUM(SALES_AMOUNT)
FROM SALES_DB
WHERE YEAR = '2012';

-- Total sales for January of 2013

SELECT SUM(SALES_AMOUNT)
FROM SALES_DB
WHERE ORDER_DATE >= '2013-01-01'
	AND ORDER_DATE < '2013-02-01' 
	
	
-- Find the total profit gains from products in December of 2013

SELECT SUM (PROFIT)
FROM SALES_DB WHERE COUNTRY = 'United States'
AND ORDER_DATE >= '2013-12-01'
AND ORDER_DATE < '2014-01-01' 

-- Find the average of profit gains from products priced over $100 in December of 2013
SELECT AVG(SALES_AMOUNT)
FROM SALES_DB
WHERE COUNTRY = 'United States'


-- Find the product, category, and country where profits were over $1000
SELECT PRODUCT_NAME,
	CATEGORY,
	COUNTRY
FROM SALES_DB
WHERE PROFIT > 1000 


-- Total sales for United States in 2012
SELECT SUM(SALES_AMOUNT)
FROM SALES_DB
WHERE COUNTRY = 'United States'
	AND YEAR = '2012' 


-- find the transactions having the highest sales
SELECT *
FROM SALES_DB
WHERE SALES_AMOUNT = (
		SELECT MAX(SALES_AMOUNT)
		FROM SALES_DB
	)


--product name, category, region, and Countries where no profit is gained despite sales being at least $50
SELECT DISTINCT COUNTRY,
	CATEGORY,
	REGION,
	PRODUCT_NAME
FROM SALES_DB
WHERE SALES_AMOUNT >= 50
	AND PROFIT <= 0 
	
-- Show people who ordered at least one Wilson Jones Product in the united states
SELECT *
FROM SALES_DB
WHERE PRODUCT_NAME LIKE 'Wilson Jones%'
	AND COUNTRY = 'United States' 


-- Show number of Wilson Jones Products sold in the united states
SELECT SUM(QUANTITY)
FROM SALES_DB
WHERE PRODUCT_NAME LIKE 'Wilson Jones%'
	AND COUNTRY = 'United States'
# DATA CLEANING
SELECT *
FROM `gadget sales`;

SELECT DISTINCT COUNT(*) AS num_rows
FROM `gadget sales`;

-- GETTING THE REVENUE.
SELECT (`Unit Price`*`Order Qty`) as Revenue
FROM `gadget sales`;

-- SUM OF THE REVENUE, ROUNDED AND FORMATTED(ADDING COMMAS)
SELECT FORMAT(ROUND(sum((`Unit Price`*`Order Qty`)),0),0) as Total_Rev
FROM `gadget sales`;

-- THE PROFIT  : unit cost - unit price
SELECT ROUND((`Unit Price`-`Unit Cost`),2) AS Profit
FROM `gadget sales`;

-- Total profit generated
SELECT FORMAT(ROUND(SUM((`Unit Price`-`Unit Cost`)),0),0) AS Total_Profit
FROM `gadget sales`;

-- Which top 10 products have generated the highest revenue
SELECT `Product Sub Category`,`Product Category`, SUM(`Unit Price`*`Order Qty`) as Revenue
FROM `gadget sales`
GROUP BY `Product Category`
ORDER BY Revenue DESC
LIMIT 10;

-- PRODUCTS WITH THE LEAST REVENUE
SELECT `Product Name`,`Product Sub Category`,`Product Category`, ROUND((`Unit Price`*`Order Qty`),2) as Revenue
FROM `gadget sales`
ORDER BY Revenue ASC
LIMIT 10;

-- WHICH 10 ZONES PRODUCE THE HIGHEST REVENUE
SELECT Zone,ROUND((`Unit Price`*`Order Qty`),2) as Revenue
FROM `gadget sales`
ORDER BY 2 DESC
LIMIT 10;

-- ZONES WITH LEAST REVENUE
SELECT Zone,ROUND((`Unit Price`*`Order Qty`),2) as Revenue
FROM `gadget sales`
ORDER BY 2 ASC
LIMIT 10;

-- 10 CUSTOMERS WITH THE HIGHEST PURCHASE WHEN 'NO DISCOUNT' WAS NOT INVLOVED
SELECT `Product Category`,COUNT(`Order Qty`) AS Num_qty
FROM `gadget sales`
GROUP BY `Product Category`
ORDER BY 2 DESC;

-- PRODUCT CATEGORY GENERATING HIGH SALES
SELECT `Product Category`, format(round(SUM(`Unit Price`* `Order Qty`),0),0)AS Total_sales
FROM `gadget sales`
GROUP BY `Product Category`
ORDER BY Total_sales ASC;

-- AVERAGE TOTAL SALES
SELECT format(round(AVG(`Unit Price`* `Order Qty`),0),0)AS AVG_sales
FROM `gadget sales`;

-- average qunatity
SELECT ROUND(AVG(`Order Qty`),2) AS avg_qty
FROM `gadget sales`;

-- WHAT CHANNEL PRODUCES HIGHEST SALES
SELECT Channel,FORMAT(ROUND(SUM(`Unit Price`*`Order Qty`),0),0) AS total_sales
FROM `gadget sales`
GROUP BY Channel;

-- WHICH PROMOTION NAME PROODUCED THE HIGHEST SALE
SELECT `Promotion Name`, FORMAT(ROUND(SUM(`Unit Price`*`Order Qty`),0),0) AS total_sales
FROM `gadget sales`
GROUP BY `Promotion Name`;

-- DATE WHEN THE HIGHEST SALE WAS MADE
SELECT `Order Date`,MAX(`Unit Price`*`Order Qty`) as max_sales
FROM `gadget sales`
GROUP BY `Order Date`
LIMIT 1;

-- the customer with the highest sales
SELECT `Order ID`,MAX(`Unit Price`*`Order Qty`) as max_sales
FROM `gadget sales`
GROUP BY `Order ID`
LIMIT 1;



















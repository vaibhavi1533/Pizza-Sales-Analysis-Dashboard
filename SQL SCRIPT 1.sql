CREATE DATABASE PIZZA_DB;
USE PIZZA_DB;

SELECT * FROM PIZZA_SALES;
SELECT SUM(total_price) AS Total_Revenue from PIZZA_SALES;
SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value FROM PIZZA_SALES;
SELECT SUM(quantity) AS TOTAL_PIZZA_SOLD FROM PIZZA_SALES;
SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDERS FROM PIZZA_SALES;
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVG_PIZZAS_PER_ORDER FROM PIZZA_SALES;

SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_weekday, COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM PIZZA_SALES
GROUP BY order_weekday
ORDER BY FIELD(order_weekday, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

SELECT MONTHNAME(STR_TO_DATE(order_date,'%d-%m-%Y')) AS MONTH_NAME, COUNT(DISTINCT order_id) as TOTAL_ORDERS
FROM PIZZA_SALES
GROUP BY MONTH_NAME
ORDER BY FIELD(MONTH_NAME, 'JANUARY','FEBRUARY','MARCH','APRIL','MAY','JUNE','JULY','AUGUST','SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER');

SELECT * FROM PIZZA_SALES;

SELECT pizza_category, CAST(SUM(TOTAL_PRICE) AS DECIMAL(10,2)) AS TOTAL_REVENUE,
CAST(sum(total_price)*100 / (select sum(total_price) from pizza_sales) AS DECIMAL(10,2)) as PCT
from pizza_sales 
GROUP BY pizza_category;

SELECT pizza_size, CAST(SUM(TOTAL_PRICE) AS DECIMAL(10,2)) AS TOTAL_REVENUE,
CAST(sum(total_price)*100 / (select sum(total_price) from pizza_sales) AS DECIMAL(10,2)) as PCT
from pizza_sales
GROUP BY pizza_size;

SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC
LIMIT 5;

SELECT pizza_name, COUNT(Distinct order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

SELECT pizza_name, COUNT(Distinct order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;



 




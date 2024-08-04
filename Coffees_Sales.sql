CREATE DATABASE Coffee_Shop_Management

use Coffee_Shop_Management

SELECT TOP 3 * FROM coffee_sales
--> Calculate the Total Sales
SELECT ROUND(SUM(transaction_qty * unit_price),2) as Total_Sales from coffee_sales

--> Total Transactions
SELECT COUNT(transaction_id) as Total_Transactions from coffee_sales

--> Calculate the Average Bill by per person
SELECT ROUND( SUM(transaction_qty*unit_price)
/ count(transaction_qty),2) AS Average_Bill_Per_Person
from coffee_sales

--> Calculate the Average Order by per person
SELECT ROUND(SUM(transaction_qty) / COUNT (transaction_qty), 2) AS Average_Order
FROM coffee_sales;
--> Top 5 Products based on the sales
SELECT top 5 round(sum(transaction_qty * unit_price),2)
as total_Sold,product_type
from coffee_sales
group by product_type 
order by total_Sold desc

--> Total Transactions and Sales based on store locations.

SELECT round(sum(transaction_qty * unit_price),2)
as total_Sold,COUNT(transaction_id) as Total_Transactions,
store_location from coffee_sales
group by store_location


--> Extract the transactions based on the hours
select * from coffee_sales
SELECT DATEPART(hour,transaction_time) as 'Hour of the Day',
sum(transaction_qty) as Total_Transactions
from coffee_sales
group by DATEPART(hour,transaction_time)
ORDER BY [Hour of the Day] 

--> Calculate the Total Transactions on each day of the week
--> Calculate the total sales
SELECT  DATENAME(WEEKDAY,transaction_date) as 'Day',
sum(transaction_qty) as Total_Transactions,
round(sum(transaction_qty * unit_price),2) as Total_Sales
from coffee_sales
group by DATENAME(WEEKDAY,transaction_date)
ORDER BY [Day]


--> Calculate the Total Transactions on each month
--> Calculate the total sales
SELECT  DATENAME(MONTH,transaction_date) as 'Month',
sum(transaction_qty) as Total_Transactions,
round(sum(transaction_qty * unit_price),2) as Total_Sales
from coffee_sales
group by DATENAME(MONTH,transaction_date)
ORDER BY [Month]

--> Caculate the percentage distribution in sales
--  using the product category...

SELECT sum(transaction_qty) as Total_Sold,
product_category, sum(transaction_qty*unit_price)
/(SELECT ROUND(SUM(transaction_qty*unit_price),2)
FROM 
coffee_sales)*100 as Sales_Percentage 
FROM coffee_sales
group by product_category







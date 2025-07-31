CREATE DATABASE EcommerceCustomerDataset;
USE EcommerceCustomerDataset;

SELECT * FROM customersdataset;   --Customer Table 1
SELECT * FROM geolocation;		  --Location Table 3
SELECT * FROM orderpayments;	  --Payment Table 4
SELECT * FROM orderreviews;		  --Order Review Table 5
SELECT * FROM ordersdataset;	  --Orders Table 6
SELECT * FROM productcategory;	  --Products Category Table 7
SELECT * FROM productsdataset;	  --Products Table 8
SELECT * FROM orderitemdataset;   --Order Table 2
SELECT * FROM sellers;			  --Sellers Table 9

--1. Monthly Order Trend
--Show the total number of orders each month.

SELECT 
  DATENAME(MONTH, order_purchase_timestamp) AS Order_Month,
  DATEPART(MONTH, order_purchase_timestamp) AS Month_Number,
  COUNT(order_id) AS Total_Order
FROM ordersdataset
GROUP BY 
  DATENAME(MONTH, order_purchase_timestamp),
  DATEPART(MONTH, order_purchase_timestamp)
ORDER BY 
  Month_Number;


  --2. Top 5 Selling Product Categories by Quantity
  --Find top 5 product categories based on the quantity sold.

  SELECT TOP 5 product_category_name , COUNT(product_category_name) AS Total_Product FROM productsdataset
  GROUP BY product_category_name 
  ORDER BY Total_Product DESC;


SELECT TOP 5 p.product_category_name ,
COUNT(DISTINCT p.product_id) AS Total_product,
COUNT(order_id) AS  Total_order
FROM productsdataset p
LEFT JOIN orderitemdataset ord ON ord.product_id= p.product_id
GROUP BY p.product_category_name
ORDER BY Total_order DESC;

-- 3. Revenue by Payment Type
-- Calculate total revenue collected through each payment type.

SELECT * FROM orderpayments;
SELECT * FROM orderitemdataset; 

SELECT payment_type ,
ROUND(SUM(o.price),0) AS Total_Payment 
FROM   orderpayments ord
JOIN   orderitemdataset o ON ord.order_id=o.order_id
GROUP BY payment_type;


-- 4. Customer Count by State
-- How many unique customers are there in each state ?

SELECT * FROM customersdataset;

SELECT customer_state ,COUNT(DISTINCT customer_id) AS Total_Customer
FROM   customersdataset
GROUP BY customer_state
ORDER BY Total_Customer DESC;


-- 5 Top Cities by Revenue
--Find top 10 cities by revenue.

SELECT * FROM customersdataset;
SELECT * FROM orderitemdataset; 
SELECT * FROM ordersdataset;

SELECT TOP 10 customer_state ,COUNT(customer_state) 
AS Total_Customer
FROM   customersdataset
GROUP BY customer_state
ORDER BY Total_Customer DESC;


SELECT TOP 10 customer_city, ROUND(SUM(price),0) AS Total_Revenue
FROM   customersdataset c
JOIN   ordersdataset o ON c.customer_id= o.customer_id
JOIN   orderitemdataset ord ON ord.order_id = o.order_id
GROUP BY customer_city
ORDER BY Total_Revenue DESC;


SELECT * FROM orderitemdataset;
-- 6 . Revenue per Order
-- Show order_id, number of items, and total value.

SELECT order_id,COUNT(order_item_id) AS Number_Item , SUM(price) AS Total_Value
FROM   orderitemdataset
GROUP  BY order_id
ORDER  BY Number_Item;


-- 7. Average Product Weight by Category.
SELECT * FROM productsdataset;

SELECT product_category_name, ROUND(AVG(product_weight_g),0) AS average_Product_Weight 
FROM   productsdataset
GROUP  BY product_category_name;


-- 8. Most Common Review Score.
SELECT * FROM orderreviews;	

SELECT  review_score , COUNT(*) AS 'MOST Review Score' FROM orderreviews
GROUP BY  review_score
ORDER BY  'MOST Review Score'  DESC;


-- 9. Top 5 Sellers by Revenue
-- Which sellers earned the most?
SELECT * FROM sellers;
SELECT * FROM orderitemdataset; 

SELECT TOP 5 s.seller_id , COUNT(o.price) AS Total_Revenue
FROM   sellers  s
JOIN   orderitemdataset o  ON s.seller_id = o.seller_id
GROUP BY  s.seller_id
ORDER BY  Total_Revenue DESC;



-- 10. Average Review Score by State
-- Show average review score by customer state.
SELECT * FROM orderreviews;	
SELECT * FROM ordersdataset;
SELECT * FROM customersdataset;

SELECT  c.customer_state , 
        ROUND(AVG(r.review_score),2) AS AVERAGE_SCORE
FROM    orderreviews r
JOIN    ordersdataset o ON r.order_id = o.order_id
JOIN    customersdataset c ON  o.customer_id = c.customer_id
GROUP BY  c.customer_state
ORDER BY  AVERAGE_SCORE DESC;


-- 11. Average Delivery Time (in Days)
-- Calculate the average delivery time from purchase to delivery.
SELECT * FROM ordersdataset;
SELECT 
  ROUND(AVG(DATEDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date)), 2) AS avg_delivery_time_days
FROM 
  ordersdataset;


--12  Orders Delivered Late
-- How many orders were delivered after the estimated delivery date?
SELECT 
    COUNT(order_id) AS late_orders
FROM ordersdataset
WHERE order_delivered_customer_date > order_estimated_delivery_date;




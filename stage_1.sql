--Q1 
-- What was the total revenue to the nearest dollar for customers who have paid by credit card?

SELECT
round(SUM(revenue), 0) as cc_customers
FROM customers
WHERE cc_payments = 1;


-- Q2 
-- What percentage of customers who have purchased female items have paid by credit card?

SELECT  round(x.num / y.num, 6) FROM

( SELECT count(female_items)  + 0.0 as num
FROM customers
WHERE female_items > 0 and cc_payments = 1) x
JOIN

(SELECT  count(female_items) + 0.0 as num
FROM customers
WHERE female_items > 0) y;


-- Q3
-- What was the average revenue for customers who used either iOS, Android or Desktop?


SELECT avg(revenue)
FROM customers
WHERE ios_orders > 0 or android_orders > 0 or desktop_orders > 0;


--Q4 
-- We want to run an email campaign promoting a new mens luxury brand. Can you provide a list of customers we should send to?

SELECT *
FROM customers
WHERE male_items > 0 and revenue > 0;
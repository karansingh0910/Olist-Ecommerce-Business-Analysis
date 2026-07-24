-- Olist Business Analysis SQL Queries
-- 1. Total Customers
SELECT COUNT(*) AS total_customers
FROM ecommerce.olist_customers;

-- 2. Total Sellers
SELECT COUNT(*) AS total_sellers
FROM ecommerce.olist_sellers;

-- 3. Customers by State
SELECT customer_state,
COUNT(*) AS total_customers
FROM ecommerce.olist_customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- 4. Sellers by State
SELECT seller_state,
COUNT(*) AS total_sellers
FROM ecommerce.olist_sellers
GROUP BY seller_state
ORDER BY total_sellers DESC;

-- 5. Orders by Status
SELECT order_status,
COUNT(*) AS total_orders
FROM ecommerce.olist_orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- 6. Payment Type Distribution
SELECT payment_type,
COUNT(*) AS total_payments
FROM ecommerce.olist_order_payments
GROUP BY payment_type
ORDER BY total_payments DESC;

-- 7. Average Payment
SELECT AVG(payment_value) AS average_payment
FROM ecommerce.olist_order_payments;

-- 8. Highest Payment
SELECT MAX(payment_value) AS highest_payment
FROM ecommerce.olist_order_payments;

-- 9. Lowest Payment
SELECT MIN(payment_value) AS lowest_payment
FROM ecommerce.olist_order_payments;

-- 10. Orders by Customer State
SELECT c.customer_state,
COUNT(o.order_id) AS total_orders
FROM ecommerce.olist_orders o
JOIN ecommerce.olist_customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;
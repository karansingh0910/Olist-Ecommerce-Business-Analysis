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

 11. Top 10 Product Categories by Revenue

SELECT
    p.product_category_name,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM ecommerce.olist_order_items oi
JOIN ecommerce.olist_products p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

12. Orders by Status
-- 12. Orders by Status

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM ecommerce.olist_orders
GROUP BY order_status
ORDER BY total_orders DESC;
13. Top 10 Sellers by Revenue
-- 13. Top 10 Sellers by Revenue

SELECT
    seller_id,
    ROUND(SUM(price),2) AS total_revenue
FROM ecommerce.olist_order_items
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;
14. Revenue by Month
-- 14. Revenue by Month

SELECT
    TO_CHAR(o.order_purchase_timestamp,'Mon YYYY') AS month,
    ROUND(SUM(oi.price),2) AS revenue
FROM ecommerce.olist_orders o
JOIN ecommerce.olist_order_items oi
ON o.order_id=oi.order_id
GROUP BY month, DATE_TRUNC('month',o.order_purchase_timestamp)
ORDER BY DATE_TRUNC('month',o.order_purchase_timestamp);
15. Average Delivery Time
-- 15. Average Delivery Time

SELECT
ROUND(
AVG(
order_delivered_customer_date::date - order_purchase_timestamp::date
)::numeric,2) AS avg_delivery_days
FROM ecommerce.olist_orders
WHERE order_delivered_customer_date IS NOT NULL;
16. Top 10 Customers
-- 16. Top 10 Customers

SELECT
customer_id,
COUNT(order_id) AS total_orders
FROM ecommerce.olist_orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;
17. Cancelled Orders
-- 17. Cancelled Orders

SELECT
COUNT(*) AS cancelled_orders
FROM ecommerce.olist_orders
WHERE order_status='canceled';
18. Highest Order Value
-- 18. Highest Order Value

SELECT
MAX(price) AS highest_order_value
FROM ecommerce.olist_order_items;
19. Lowest Order Value
-- 19. Lowest Order Value

SELECT
MIN(price) AS lowest_order_value
FROM ecommerce.olist_order_items;
20. Revenue by Payment Type
-- 20. Revenue by Payment Type

SELECT
payment_type,
ROUND(SUM(payment_value),2) AS total_revenue
FROM ecommerce.olist_order_payments
GROUP BY payment_type
ORDER BY total_revenue DESC;

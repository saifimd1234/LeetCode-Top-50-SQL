-- Solution 1: Using INNER JOIN and COUNT with CASE
SELECT
    ROUND(100 * SUM(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*), 2) AS immediate_percentage
FROM
    Delivery AS d
JOIN
    (SELECT customer_id, MIN(order_date) AS first_order_date FROM Delivery GROUP BY customer_id) AS first_orders
ON
    d.customer_id = first_orders.customer_id AND d.order_date = first_orders.first_order_date;

-- Explanation:
-- 1. Subquery `first_orders` gets the first order date for each customer.
-- 2. JOIN `Delivery` with `first_orders` to filter only the first orders.
-- 3. Use `CASE` to count immediate orders among first orders and calculate the percentage.

-- Solution 2: Using WINDOW FUNCTION to Rank First Orders
WITH RankedDeliveries AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rank
    FROM Delivery
)
SELECT
    ROUND(100 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*), 2) AS immediate_percentage
FROM RankedDeliveries
WHERE rank = 1;

-- Explanation:
-- 1. `RankedDeliveries` assigns a rank to each order by `order_date` for each `customer_id`.
-- 2. The main query filters for `rank = 1`, keeping only the first orders.
-- 3. Calculate the immediate orders percentage among the first orders using `CASE`.

SELECT * from delivery;
-- BEGINEER SOLUTION:
SELECT 
    ROUND(AVG(IF(d.order_date=d.customer_pref_delivery_date,1,0))*100,2) AS immediate_percentage
FROM delivery d
LEFT JOIN 
(SELECT
    customer_id,
    MIN(order_date) AS first_order
FROM Delivery
GROUP BY customer_id) f
ON d.customer_id = f.customer_id
WHERE d.order_date=f.first_order;

-- INTERMEDIATE SOLUTION:
SELECT 
   ROUND(AVG(IF(order_date = customer_pref_delivery_date, 1, 0)),2) AS immediate_percentage
FROM delivery
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date) FROM delivery GROUP BY customer_id
)

-- ADVANCE LEVEL:
SELECT
ROUND(AVG(IF(order_date = customer_pref_delivery_date, 1, 0)),2) AS immediate_percentage
FROM
(SELECT
    *,
    DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_rank
FROM Delivery) d
WHERE order_rank=1;
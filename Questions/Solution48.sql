-- Solution to the "Group Sold Products By The Date" problem
-- Steps:
-- 1. Use DISTINCT on the products for each sell_date to avoid duplicates.
-- 2. Use GROUP_CONCAT to combine product names in alphabetical order.
-- 3. Count distinct products per date for num_sold.

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM
    Activities
GROUP BY
    sell_date
ORDER BY
    sell_date;

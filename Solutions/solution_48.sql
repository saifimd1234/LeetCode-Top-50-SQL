
-- Solution 1: Direct Approach using GROUP BY and STRING_AGG (for MySQL 8+)
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

-- Solution 2: Using a Subquery
SELECT
    sell_date,
    COUNT(product) AS num_sold,
    GROUP_CONCAT(product ORDER BY product) AS products
FROM
    (SELECT DISTINCT sell_date, product FROM Activities) AS DistinctProducts
GROUP BY
    sell_date
ORDER BY
    sell_date;

-- Solution 3: Using Common Table Expressions (CTE)
WITH UniqueProducts AS (
    SELECT DISTINCT sell_date, product
    FROM Activities
)
SELECT
    sell_date,
    COUNT(product) AS num_sold,
    GROUP_CONCAT(product ORDER BY product) AS products
FROM
    UniqueProducts
GROUP BY
    sell_date
ORDER BY
    sell_date;

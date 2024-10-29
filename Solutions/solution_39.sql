-- USING SINGLE CTE AND WHERE CLAUSE(to define the window size and to filter the start date)
WITH cte AS (
    SELECT
    visited_on,
    SUM(amount) AS total
FROM Customer
GROUP BY visited_on)
SELECT
    a.visited_on,
    SUM(b.total) AS amount,
    ROUND(AVG(b.total), 2) AS average_amount
FROM cte a
LEFT JOIN cte b
ON a.visited_on>=b.visited_on
WHERE DATEDIFF(a.visited_on,b.visited_on) BETWEEN 0 AND 6 -- define window size
AND a.visited_on >=(SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY) FROM Customer) -- filters the start date to 7th day
GROUP BY a.visited_on
ORDER BY a.visited_on;



-- USING TWO CTE's:
-- cte to get the total amount of each day
WITH cte AS (
    SELECT 
        visited_on,
        SUM(amount) AS amount
    FROM 
        Customer
    GROUP BY 
        visited_on
),
-- rolling_totals cte to rolling average
rolling_totals AS (
    SELECT 
        visited_on,
        SUM(amount) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS total_amount,
        ROUND(AVG(amount) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2) AS average_amount
    FROM 
        cte
)
-- this select filters the output from the 7th day
SELECT 
    visited_on,
    total_amount AS amount,
    average_amount
FROM 
    rolling_totals
WHERE 
    visited_on >= (SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY) FROM cte)
ORDER BY 
    visited_on;
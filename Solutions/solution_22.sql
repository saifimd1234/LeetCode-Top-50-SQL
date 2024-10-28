-- Solution 1: Using Self-Join to Identify Consecutive Logins

-- Identify players with consecutive logins starting from their first login
WITH First_Login AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
Consecutive_Login AS (
    SELECT a.player_id
    FROM Activity a
    JOIN First_Login fl ON a.player_id = fl.player_id
    WHERE a.event_date = DATE_ADD(fl.first_login_date, INTERVAL 1 DAY)
)
-- Calculate the fraction of players with consecutive logins
SELECT 
    ROUND(COUNT(DISTINCT cl.player_id) / COUNT(DISTINCT fl.player_id), 2) AS fraction
FROM 
    First_Login fl
LEFT JOIN 
    Consecutive_Login cl ON fl.player_id = cl.player_id;

-- Explanation:
-- 1. `First_Login`: Identifies the first login date for each player.
-- 2. `Consecutive_Login`: Joins `Activity` with `First_Login` to find players who logged in the day after their first login.
-- 3. The final selection calculates the fraction by counting distinct players in `Consecutive_Login` (numerator) and `First_Login` (denominator).

-- Solution 2: Using Lag and Aggregation Functions

WITH Player_Activity AS (
    SELECT
        player_id,
        event_date,
        LAG(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS previous_date
    FROM
        Activity
),
Consecutive_Players AS (
    SELECT DISTINCT player_id
    FROM Player_Activity
    WHERE DATEDIFF(event_date, previous_date) = 1
)
-- Final result calculating fraction
SELECT 
    ROUND(COUNT(DISTINCT cp.player_id) / COUNT(DISTINCT pa.player_id), 2) AS fraction
FROM 
    Activity pa
LEFT JOIN 
    Consecutive_Players cp ON pa.player_id = cp.player_id;

-- Explanation:
-- - `Player_Activity`: Uses `LAG` to create a new column showing the previous login date per player.
-- - `Consecutive_Players`: Filters players with logins on consecutive days.
-- - The final calculation computes the fraction of players who logged in consecutively.

-- Applied on LEETCODE:
SELECT
 ROUND(COUNT(t.player_id)/(SELECT COUNT(DISTINCT a.player_id)), 2) AS fraction
FROM activity a
LEFT JOIN 
(SELECT
    player_id,
    MIN(event_date) AS fld
FROM activity
GROUP BY player_id) t
ON a.player_id=t.player_id AND
DATE_SUB(a.event_date, INTERVAL 1 DAY) = t.fld
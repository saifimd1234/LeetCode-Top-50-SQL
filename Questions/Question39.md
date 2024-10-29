# LeetCode Question 1321: Restaurant Growth

## Table Structure

**Table: Customer**

| Column Name | Type    |
|-------------|---------|
| customer_id | int     |
| name        | varchar |
| visited_on  | date    |
| amount      | int     |

- **customer_id**: The ID of the customer.
- **name**: Name of the customer.
- **visited_on**: Date on which the customer visited the restaurant.
- **amount**: The total amount paid by the customer.

In SQL, `(customer_id, visited_on)` is the primary key.

## Description
The task is to compute the **7-day moving average** of the amounts paid by customers in a 7-day window, which includes the current day and the six preceding days. The **average_amount** should be rounded to two decimal places.

The result should be ordered by **visited_on** in ascending order.

## Example
**Input:**

**Customer Table:**
| customer_id | name   | visited_on | amount |
|-------------|--------|------------|--------|
| 1           | Jhon   | 2019-01-01 | 100    |
| 2           | Daniel | 2019-01-02 | 110    |
| 3           | Jade   | 2019-01-03 | 120    |
| 4           | Khaled | 2019-01-04 | 130    |
| 5           | Winston| 2019-01-05 | 110    |
| 6           | Elvis  | 2019-01-06 | 140    |
| 7           | Anna   | 2019-01-07 | 150    |
| 8           | Maria  | 2019-01-08 | 80     |
| 9           | Jaze   | 2019-01-09 | 110    |
| 1           | Jhon   | 2019-01-10 | 130    |
| 3           | Jade   | 2019-01-10 | 150    |

**Output:**

| visited_on | amount | average_amount |
|------------|--------|----------------|
| 2019-01-07 | 860    | 122.86         |
| 2019-01-08 | 840    | 120            |
| 2019-01-09 | 840    | 120            |
| 2019-01-10 | 1000   | 142.86         |

## Explanation
- **2019-01-07**: Sum for 7-day period from 2019-01-01 to 2019-01-07 is 860; average is 122.86.
- **2019-01-08**: Sum for 7-day period from 2019-01-02 to 2019-01-08 is 840; average is 120.
- **2019-01-09**: Sum for 7-day period from 2019-01-03 to 2019-01-09 is 840; average is 120.
- **2019-01-10**: Sum for 7-day period from 2019-01-04 to 2019-01-10 is 1000; average is 142.86.
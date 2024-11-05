# SQL Practice Question: Group Sold Products By The Date

### Problem Description
Given an `Activities` table, write a query to find, for each date, the number of different products sold and their names. The sold product names for each date should be sorted lexicographically.

The result should include:
1. `sell_date`: The date of sale.
2. `num_sold`: Number of unique products sold on that date.
3. `products`: A comma-separated list of product names, sorted alphabetically.

### Table Structure
**Activities**

| Column Name | Type    |
|-------------|---------|
| sell_date   | date    |
| product     | varchar |

- There is no primary key for this table.
- It may contain duplicate rows.

### Example
Input:

| sell_date  | product     |
|------------|-------------|
| 2020-05-30 | Headphone   |
| 2020-06-01 | Pencil      |
| 2020-06-02 | Mask        |
| 2020-05-30 | Basketball  |
| 2020-06-01 | Bible       |
| 2020-06-02 | Mask        |
| 2020-05-30 | T-Shirt     |

Expected Output:

| sell_date  | num_sold | products                    |
|------------|----------|-----------------------------|
| 2020-05-30 | 3        | Basketball,Headphone,T-Shirt|
| 2020-06-01 | 2        | Bible,Pencil                |
| 2020-06-02 | 1        | Mask                        |

**Explanation**:
For `2020-05-30`, sold items were `Headphone`, `Basketball`, and `T-Shirt`, sorted lexicographically. For `2020-06-01`, sold items were `Pencil` and `Bible`, sorted lexicographically. For `2020-06-02`, the sold item is `Mask`.


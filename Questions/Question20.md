## Question 1193: Monthly Transactions I

### Table Structure
#### Table: `Transactions`
| Column Name   | Type    |
|---------------|---------|
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |

- `id`: Primary key for transactions.
- `state`: Enum with values ["approved", "declined"].
- `trans_date`: Date of each transaction.

### Requirements
For each month and country:
1. Find the total number of transactions and their total amount.
2. Find the number of approved transactions and their total amount.

### Output Format
- **Columns**: `month`, `country`, `trans_count`, `approved_count`, `trans_total_amount`, `approved_total_amount`
- Sort: Any order.

### Example

#### Input:
Transactions Table:
| id   | country | state    | amount | trans_date |
|------|---------|----------|--------|------------|
| 121  | US      | approved | 1000   | 2018-12-18 |
| 122  | US      | declined | 2000   | 2018-12-19 |
| 123  | US      | approved | 2000   | 2019-01-01 |
| 124  | DE      | approved | 2000   | 2019-01-07 |

#### Output:
| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
|----------|---------|-------------|----------------|--------------------|-----------------------|
| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
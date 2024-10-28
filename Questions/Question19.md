## Question 19: Queries Quality and Percentage

### Table Structure
#### Table: `Queries`
| Column Name | Type    |
|-------------|---------|
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |

- `position`: Ranges from 1 to 500.
- `rating`: Ranges from 1 to 5. A rating below 3 indicates a poor query.

### Definitions
- **Query Quality**: The average ratio of `rating / position` for each `query_name`.
- **Poor Query Percentage**: Percentage of rows with `rating` < 3, for each `query_name`.

### Output Requirements
1. Each `query_name` should display `quality` and `poor_query_percentage`, rounded to two decimal places.
2. Sort results by `query_name` in any order.

### Example

#### Input:
Queries Table:
| query_name | result            | position | rating |
|------------|--------------------|----------|--------|
| Dog        | Golden Retriever   | 1        | 5      |
| Dog        | German Shepherd    | 2        | 5      |
| Dog        | Mule               | 200      | 1      |
| Cat        | Shirazi            | 5        | 2      |
| Cat        | Siamese            | 3        | 3      |
| Cat        | Sphynx             | 7        | 4      |

#### Output:
| query_name | quality | poor_query_percentage |
|------------|---------|-----------------------|
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |

#### Explanation:
- **Dog**: Quality = `((5/1) + (5/2) + (1/200)) / 3 = 2.50`. Poor query percentage = `(1/3) * 100 = 33.33`.
- **Cat**: Quality = `((2/5) + (3/3) + (4/7)) / 3 = 0.66`. Poor query percentage = `(1/3) * 100 = 33.33`.
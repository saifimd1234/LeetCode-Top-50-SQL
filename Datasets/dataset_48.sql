/*
### SQL Dataset (for `.sql` File)
You can use the following SQL insert statements to create and populate the table for testing purposes.

---

### 2. **Dataset File (SQL) - `dataset.sql`**
*/

```sql
CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR(50)
);

INSERT INTO Activities (sell_date, product) VALUES
('2020-05-30', 'Headphone'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');
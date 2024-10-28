-- Create the Transactions table
CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(50),
    state ENUM('approved', 'declined'),
    amount INT,
    trans_date DATE
);

-- Populate the Transactions table
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');
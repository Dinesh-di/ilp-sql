CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Customers (customer_name) VALUES
('Alice'), ('Bob'), ('Charlie'), ('Diana');

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2023-01-01'),
(1, '2023-01-15'),
(1, '2023-01-20'),
(1, '2023-02-01'),
(2, '2023-01-05'),
(2, '2023-01-18'),
(3, '2023-02-10'),
(4, '2023-03-01'),
(4, '2023-03-10'),
(4, '2023-03-20'),
(4, '2023-04-01');

SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 3;

CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    price INTEGER
);
INSERT INTO Products (product_name, price) VALUES
('Laptop', 800),
('Smartphone', 600),
('Tablet', 400),
('Monitor', 300),
('Keyboard', 150),
('Mouse', 100),
('Printer', 500);

SELECT *
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
);

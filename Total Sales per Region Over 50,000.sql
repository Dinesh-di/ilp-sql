CREATE TABLE Sales (
    sale_id INTEGER PRIMARY KEY,
    region TEXT,
    sales_amount INTEGER
);
INSERT INTO Sales (region, sales_amount) VALUES
('North', 12000),
('North', 18000),
('South', 25000),
('South', 30000),
('East', 60000),
('West', 15000),
('East', 7000),
('West', 40000),
('Central', 52000);

SELECT region, SUM(sales_amount) AS total_sales
FROM Sales
GROUP BY region
HAVING SUM(sales_amount) > 50000;

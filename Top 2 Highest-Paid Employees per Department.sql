CREATE TABLE Employees (
    employee_id INTEGER PRIMARY KEY,
    name TEXT,
    department_id INTEGER,
    salary INTEGER
);
INSERT INTO Employees (name, department_id, salary) VALUES
('Alice', 1, 90000),
('Bob', 1, 85000),
('Charlie', 1, 70000),
('David', 2, 95000),
('Eve', 2, 92000),
('Frank', 2, 88000),
('Grace', 3, 87000);
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn
    FROM Employees
) ranked
WHERE rn <= 2;

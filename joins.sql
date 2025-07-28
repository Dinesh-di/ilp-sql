-- Departments table
CREATE TABLE departments (
  id INTEGER PRIMARY KEY,
  name TEXT
);

-- Employees table
CREATE TABLE employees (
  id INTEGER PRIMARY KEY,
  name TEXT,
  department_id INTEGER,
  salary INTEGER,
  hire_date DATE
);

-- Insert sample departments
INSERT INTO departments VALUES 
  (1, 'HR'), 
  (2, 'Engineering'), 
  (3, 'Marketing');

-- Insert sample employees
INSERT INTO employees VALUES 
  (1, 'Alice', 2, 80000, '2020-05-20'),
  (2, 'Bob', 1, 50000, '2021-02-15'),
  (3, 'Charlie', 2, 95000, '2019-11-10'),
  (4, 'Diana', 3, 60000, '2022-08-01'),
  (5, 'Eve', 2, 78000, '2023-01-12');
SELECT 
  e.id, e.name AS employee_name, d.name AS department_name, e.salary
FROM 
  employees e
JOIN 
  departments d ON e.department_id = d.id;
SELECT * 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
WITH engineering_employees AS (
  SELECT 
    e.*
  FROM 
    employees e
  JOIN 
    departments d ON e.department_id = d.id
  WHERE 
    d.name = 'Engineering'
)
SELECT *
FROM engineering_employees
WHERE salary > 80000;
SELECT 
  id, name, salary,
  ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;
SELECT 
  id, name, salary,
  RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
CREATE INDEX idx_employees_department_id ON employees(department_id);
EXPLAIN
SELECT 
  e.id, e.name, d.name AS department_name, e.salary
FROM 
  employees e
JOIN 
  departments d ON e.department_id = d.id;



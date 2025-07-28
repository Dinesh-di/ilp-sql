CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT
);
INSERT INTO Students (name, email) VALUES
('Anya', 'anya@example.com'),
('Bruno', 'bruno@example.com'),
('Clara', 'clara@example.com'),
('Bruno Duplicate', 'bruno@example.com'),
('Derek', 'derek@example.com'),
('Eve', 'eve@example.com'),
('Clara Again', 'clara@example.com');
SELECT email, COUNT(*) AS occurrences
FROM Students
GROUP BY email
HAVING COUNT(*) > 1;

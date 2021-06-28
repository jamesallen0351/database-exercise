USE employees;
-- #2 Irena Reutenauer, Vidya Simmen
SELECT * 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC;

-- #3 Irena Acton, Vidya Zweizig
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

-- #4 Irena Acton, Maya Zyda
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

-- #5 899 rows, 10021 Ramzi Erde, 499648 Tadahiro Erde
SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no;

-- #6 899 Rows Teiji Eldridge, Sergi Erde
SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;

-- #7 362 rows, Khun Bernini, Douadi Pettis
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC;


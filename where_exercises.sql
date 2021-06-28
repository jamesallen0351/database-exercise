USE employees;

SELECT *
FROM employees;

SELECT first_name FROM employees WHERE first_name IN('Irena', 'Vidya', 'Maya');

-- #3 709 rows affected
SELECT *
	FROM employees
	WHERE (first_name = 'Irena'
		OR first_name = 'Vidya'
		OR first_name = 'Maya');

-- #4 441 rows affected
SELECT *
	FROM employees
	WHERE (first_name = 'Irena'
		OR first_name = 'Vidya'
		OR first_name = 'Maya')
		AND gender = 'M';

-- #5 7330 records
SELECT *
	FROM employees
	WHERE last_name LIKE 'E%';
	
-- #6 30723 rows
SELECT *
	FROM employees
	WHERE (last_name LIKE 'E%') OR (last_name LIKE '%E');
	
-- #7 23393 rows	
SELECT *
	FROM employees
	WHERE (last_name NOT LIKE 'E%') AND (last_name LIKE '%E');
	
-- #6 899 rows
SELECT *
	FROM employees
	WHERE (last_name LIKE 'E%') AND (last_name LIKE '%E');

-- #7 24292 rows
SELECT *
	FROM employees
	WHERE last_name LIKE '%E';

-- #8 135214 rows
SELECT *
	FROM employees
	WHERE hire_date LIKE '199%';

-- #9 842
SELECT * 
	FROM employees
	WHERE birth_date LIKE '%12-25';
	
-- #10 362
SELECT * 
	FROM employees
	WHERE (hire_date LIKE '199%' AND birth_date LIKE '%12-25');
	
-- #11 1873
SELECT * 
	FROM employees
	WHERE last_name LIKE '%q%';
	
-- #12 547
SELECT * 
	FROM employees
	WHERE (last_name LIKE '%q%' AND last_name NOT LIKE '%qu%');
	

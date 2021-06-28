USE `employees`;

-- GROUP BY Excercises

DESCRIBE titles;

-- #2 7 distinct titles
SELECT DISTINCT title
FROM titles;

-- #3 5 rows
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- #4 846 rows
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name;

-- #5 Chleq, Lindqvist, Qiwen
SELECT last_name
FROM employees
WHERE (last_name LIKE '%q%' AND last_name NOT LIKE '%qu%')
GROUP BY last_name;

-- #6
SELECT last_name, count(*)
FROM employees
WHERE (last_name LIKE '%q%' AND last_name NOT LIKE '%qu%')
GROUP BY last_name;

-- #7

SELECT first_name, gender, count(gender) as count_of_gender
FROM employees
WHERE (first_name = 'Irena'
		OR first_name = 'Vidya'
		OR first_name = 'Maya')
GROUP BY first_name, gender
ORDER BY first_name;

-- #8 


select lower(concat(
    substr(first_name, 1, 1), # first initial of first name
    substr(last_name, 1, 4), # first 4 of last name
		 "_",
		 substr(hire_date, 6, 2), # month
		 substr(hire_date, 3, 2) # 2 yr
)) as username,first_name, last_name, birth_date
from employees
group by username, first_name, last_name, birth_date
Order by username ASC;

-- #8 Updated
SELECT CONCAT
	(
	SUBSTR(LOWER(first_name),1,1),
	SUBSTR(LOWER(last_name),1,4),
	"_",
	DATE_FORMAT((birth_date),'%m'),
	DATE_FORMAT((birth_date),'%y')
	) AS username,
 COUNT('username') as count
FROM employees
GROUP BY username
HAVING count>1;




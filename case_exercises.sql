# Case_Exercises

-- 1 Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

select *
from dept_emp;

select emp_no, dept_no, from_date, to_date, to_date > curdate() as is_current_employee 
from dept_emp;

select distinct emp_no, dept_no, from_date, to_date, 
	if(to_date >= now(), true, false) as is_current_employee
from employees.current_dept_emp
order by emp_no; -- used current_dept_emp table

SELECT emp_no, dept_no, from_date, to_date, 
	IF(to_date >= NOW(), true, false) AS is_current_employee
	FROM employees.dept_emp; -- used dept_emp table

describe current_dept_emp; -- looking at the fields in current_dept_emp

-- # Codeup solution
SELECT 
	de.emp_no,
	dept_no,
	hire_date,
	to_date,
	IF(to_date > CURDATE(), 1, 0) AS current_employee
FROM dept_emp AS de
JOIN (SELECT 
			emp_no,
			MAX(to_date) AS max_date
		FROM dept_emp
		GROUP BY emp_no) as last_dept 
		ON de.emp_no = last_dept.emp_no
			AND de.to_date = last_dept.max_date
JOIN employees AS e ON e.emp_no = de.emp_no;


-- 2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

select last_name, first_name,
	case
		when substring(last_name,1,1) >= 'a' and substring(last_name,1,1) <= 'h' then 'A-H'
		when substring(last_name,1,1) >= 'i' and substring(last_name,1,1) <= 'q' then 'I-Q'
		when substring(last_name,1,1) >= 'r' and substring(last_name,1,1) <= 'z' then 'R-Z'
		else null
		end as alpha_group
from employees;  -- I did last_name, first_name because I can and it relates to the alpha_group

-- # Codeup solution

SELECT
	CONCAT(first_name, ' ', last_name) AS employee_name,
	CASE
		WHEN LEFT(last_name, 1) IN('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h') THEN 'A-H'
		WHEN LEFT(last_name, 1) IN('i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q') THEN 'I-Q'
		ELSE 'R-Z'
	END AS alpha_group
FROM employees;


-- 3 How many employees (current or previous) were born in each decade?

select count(*) as count, concat(decade, '-', decade + 9) as year
from (select floor(year(birth_date) / 10) * 10 as decade
      from employees) t
group by decade;

select
	floor(year(birth_date) / 10) * 10 as decade
from employees; -- this list the birthdates as the decade

select count(*), concat(decade,'-', decade + 9) as 'birth_decade'
from (select floor(year(birth_date) / 10) * 10 as decade
      from employees) t
group by decade; -- I think this is the answer ?

select 
case
when birth_date >= '1930-01-01' and birth_date < '1940-01-01' then "30's"
when birth_date >= '1940-01-01' and birth_date < '1950-01-01' then "40's"
when birth_date >= '1950-01-01' and birth_date < '1960-01-01' then "50's"
when birth_date >= '1960-01-01' and birth_date < '1970-01-01' then "60's"
when birth_date >= '1970-01-01' and birth_date < '1980-01-01' then "70's"
when birth_date >= '1980-01-01' and birth_date < '1990-01-01' then "80's"
when birth_date >= '1990-01-01' and birth_date < '2000-01-01' then "90's"
when birth_date >= '2000-01-01' and birth_date < '2010-01-01' then "2000's"
else null
end as decade
from employees; -- this is the group solution to the answer

select birth_date
from employees
order by birth_date desc; -- checking to see range of birthdates asc / desc ; only born between 1950's - 1960's

select concat(substring(birth_date,1,3), "0's") as year, count(*) as count
from employees
group by year; -- simple solution produced by the group

-- # Codeup solution

SELECT
	CASE
		WHEN birth_date LIKE '195%' THEN '50s'
		WHEN birth_date LIKE '196%' THEN '60s'
		ELSE 'YOUNG'
	END AS decade,
	COUNT(*)
FROM employees
GROUP BY decade;

-- # Bonus

-- 1 What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?


select dept_group, avg(salary) as avg_salary
from
(select salary, dept_name,
case
when dept_name in ('Finance', 'Human Resources') then 'Finance & HR'
when dept_name in ('Sales', 'Marketing') then 'Sales & Marketing'
when dept_name in ('Production', 'Quality Management') then 'Prod & QM'
when dept_name in ('Research', 'Development') then 'R&D'
else dept_name
end as dept_group
from departments
join dept_emp
using (dept_no)
join salaries
on salaries.emp_no = dept_emp.emp_no
and salaries.to_date >=now()) as department_salaries
group by dept_group
order by avg_salary; -- group answer to the bonus question
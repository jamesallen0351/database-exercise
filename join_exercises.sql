-- Join Exercises

-- 1 Use the join_example_db. Select all the records from both the users and roles tables.
use `join_example_db`;

select *
from users
join roles on roles.id = users.role_id;

-- 2 Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

select *
from users
left join roles on roles.id = users.role_id;

select *
from users
right join roles on roles.id = users.role_id;

-- 3 Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

select roles.name count(*) as number_of_users
from roles
join users on roles.id = users.role_id
group by roles.name;

SELECT roles.name AS role_name, COUNT(*) AS count
FROM 
	roles
RIGHT JOIN 
	users
		ON 
		 users.role_id = roles.id
GROUP BY roles.name
ORDER BY role_name;



-- Employees Database

-- 1 Use the employees database.
use `employees`;

-- 2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager', d.dept_name as 'Department Name'
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  where to_date >= now()
 order by dept_name;
 
  -- 3 Find the name of all departments currently managed by women.
  
  SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name', d.dept_name as 'Department Name'
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  where to_date >= now() and gender = 'F'
 order by dept_name;
 
 -- 4 Find the current titles of employees currently working in the Customer Service department.
 
select titles.title, count(*)
from titles
join dept_emp 
	on titles.emp_no = dept_emp.emp_no
join departments 
	on dept_emp.dept_no = departments.dept_no
where titles.to_date >= now()
  	and dept_emp.to_date >= now()
	and departments.dept_name = 'Customer Service'
group by titles.title
order by title;

-- 5 Find the current salary of all current managers.

select departments.dept_name as 'Department Name', concat(employees.first_name, ' ', employees.last_name) as 'Name', salaries.salary as 'Salary'
from departments
join dept_manager 
	on departments.dept_no = dept_manager.dept_no
join employees 
	on dept_manager.emp_no = employees.emp_no
join salaries 
	on employees.emp_no = salaries.emp_no
where dept_manager.to_date >= now()
and salaries.to_date >= now()
order by departments.dept_name;

-- 6 Find the number of current employees in each department.

select departments.dept_no, dept_name, count(*) as 'num_employees'
from departments
join dept_emp
	on departments.dept_no = dept_emp.dept_no
join employees
	on dept_emp.emp_no = employees.emp_no
where dept_emp.to_date >= now()
group by dept_no
order by dept_no;

-- 7 Which department has the highest average salary? Hint: Use current not historic information.

select dept_name as 'Department Name', avg(salaries.salary) as 'Average Salary'
from departments
join dept_emp using(dept_no)
join salaries using(emp_no)
where salaries.to_date > curdate() and dept_no ='d007'
group by dept_name
order by 'Average Salary';  




-- 8 Who is the highest paid employee in the Marketing department?
select employees.first_name, employees.last_name, max(salaries.salary) as 'max_salary'
from salaries
join employees using(emp_no)
join dept_emp using(emp_no)
join departments using(dept_no)
where dept_no = 'd001'
group by first_name, last_name
order by max_salary desc
limit 1;

SELECT employees.first_name, employees.last_name
	FROM departments
	JOIN dept_emp 
		ON departments.dept_no = dept_emp.dept_no
	JOIN employees
		ON employees.emp_no = dept_emp.emp_no
	JOIN salaries
		ON employees.emp_no = salaries.emp_no	

	WHERE dept_name = 'Marketing'
	    AND dept_emp.to_date >= NOW() 
		AND salaries.to_date >= NOW()
	ORDER BY salary DESC
	LIMIT 1;


-- 9 Which current department manager has the highest salary?

select first_name, last_name, max(salary), dept_name
from employees
join salaries using(emp_no)
join dept_manager using(emp_no)
join departments using(dept_no)
where salaries.to_date > curdate() and dept_manager.to_date > curdate()
group by first_name, last_name, salary, dept_name
order by salary desc
limit 1;

-- 10 Bonus Find the names of all current employees, their department name, and their current manager's name.

select concat(first_name, ' ', last_name) as 'Employee Name', dept_name as 'Department Name' 
from employees
join dept_emp using(emp_no)
join dept_manager using(dept_no)
join departments using(dept_no)
where dept_emp.to_date > curdate();



-- 11 Bonus Who is the highest paid employee within each department.

SELECT t1.dept_name, t1.salary,
CONCAT(first_name,' ', last_name) AS 'Employee Name'
FROM (SELECT
	dept_no, salary, dept_name, first_name, last_name
FROM
	salaries
JOIN
	dept_emp 
	USING(emp_no)
JOIN 
	departments 
	USING(dept_no)
JOIN 
	employees
	USING(emp_no)
WHERE 
	dept_emp.to_date >= NOW()
AND 
	salaries.to_date >= NOW()) AS t1
INNER JOIN
	(
		SELECT dept_name, MAX(salary) as max_salary
		FROM (SELECT
	dept_no, salary, dept_name, first_name, last_name
FROM
	salaries
JOIN
	dept_emp 
	USING(emp_no)
JOIN 
	departments 
	USING(dept_no)
JOIN 
	employees
	USING(emp_no)
WHERE 
	dept_emp.to_date >= NOW()
AND 
	salaries.to_date >= NOW()) as t2
		GROUP BY dept_name
	) t2
	ON t1.dept_name = t2.dept_name AND t1.salary = t2.max_salary
ORDER BY dept_name;
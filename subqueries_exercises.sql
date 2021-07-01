# subqueries_exercises
use employees;

-- 1 Find all the current employees with the same hire date as employee 101010 using a sub-query.

select *
from employees
where employees.hire_date = (select hire_date
from employees
where employees.emp_no = '101010')
and emp_no in (
select emp_no 
from salaries
where to_date > now()
);



-- 2 Find all the titles ever held by all current employees with the first name Aamod. 6 titles

select title
from titles
where emp_no in (select emp_no
from employees
where first_name = 'Aamod') 
and emp_no in (
select emp_no
from dept_emp 
where to_date > now()
)
group by title; -- senior staff, staff, engineer, technique leader, senior engineer, assistant engineer


-- 3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT COUNT(*)
FROM employees
JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
AND to_date < NOW(); -- 91479 not correct answer

select count(*) as 'number of employees no longer employed'
from employees
where emp_no not in (
select emp_no
from `dept_emp`
where to_date > now()
); -- 59900 correct answer

-- 4 Find all the current department managers that are female. List their names in a comment in your code.

select first_name, last_name
from employees
join dept_manager using(`emp_no`)
join departments using(`dept_no`)
where gender = 'f' and dept_manager.to_date >= now()
order by dept_name;


select *
from employees
where emp_no in (
select emp_no
from dept_manager
where to_date > now())
and gender = 'f';

-- 5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select *
from employees
where emp_no in(
select emp_no
from salaries
where salary > (select avg(salary) from salaries)
and to_date > now()
); -- 154543

select *
from employees
where emp_no in(
select emp_no
from salaries
where salary > (select avg(salary) from salaries)
)
and emp_no in (
select emp_no
from dept_emp
where to_date > now()); -- 154726



-- 6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?  -- 83

select count(*)
from salaries
where to_date > now() 
and salary > (
select max(salary) - std(salary)
from salaries
where to_date > now()
); -- 83

select (select count(*)
from salaries
where to_date > now());  -- 240124

select (83/240124)*100;


# Bonus questions

-- 1 Find all the department names that currently have female managers.


-- 2 Find the first and last name of the employee with the highest salary.


-- 3 Find the department name that the employee with the highest salary works in.

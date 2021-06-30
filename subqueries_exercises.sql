# subqueries_exercises
use employees;

-- 1 Find all the current employees with the same hire date as employee 101010 using a sub-query.

select *
from employees
where employees.hire_date = (select hire_date
from employees
where employees.emp_no = '101010');



-- 2 Find all the titles ever held by all current employees with the first name Aamod. 6 titles

select title
from titles
where emp_no in (select emp_no
from employees
where first_name = 'Aamod') 
and titles.to_date > curdate()
group by title;


-- 3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

select *
from employees;



-- 4 Find all the current department managers that are female. List their names in a comment in your code.



-- 5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.



-- 6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?




# Bonus questions

-- 1 Find all the department names that currently have female managers.


-- 2 Find the first and last name of the employee with the highest salary.


-- 3 Find the department name that the employee with the highest salary works in.

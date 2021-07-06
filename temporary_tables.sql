# temporary tables exercises
-- 1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.


use germain_1472;

create temporary table  employees_with_departments as
select first_name, last_name, dept_name
from employees.employees
join employees.dept_emp using(emp_no) 
join employees.departments using(dept_no)
where to_date >now();


select *
from employees_with_departments;


-- 1a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
alter table employees_with_departments add full_name varchar(100);

select *
from employees_with_departments;


-- 1b Update the table so that full name column contains the correct data
update employees_with_departments
set full_name = concat(first_name, " ", last_name);

select *
from employees_with_departments;


-- 1c Remove the first_name and last_name columns from the table.
alter table employees_with_departments
drop column first_name;
alter table employees_with_departments
drop column last_name;


select *
from employees_with_departments;

-- 1d What is another way you could have ended up with this same table?
use germain_1472;

drop table with 

create temporary table  employees_with_departments_1 as
select concat(first_name," ", last_name) as full_name, dept_name
from employees.employees
join employees.dept_emp using(emp_no) 
join employees.departments using(dept_no);

select *
from employees_with_departments_1
order by full_name;


-- 2 Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

use germain_1472;

create temporary table payment_amount as
select amount
from sakila.payment;

select *
from payment_amount;

alter table payment_amount modify column amount decimal (10,2);

-- select cast(amount as INT);

update payment_amount set amount = amount * 100;

select floor(amount) as cents from payment_amount;

select * from payment_amount;

drop table payment_amount;





-- 3 Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?()()


use germain_1472;

select database();

select avg(salary), std(salary)
from employees.salaries;

create temporary table compare_salaries as
select salaries.salary, departments.dept_name
from employees.salaries
join employees.employees using(emp_no)
join employees.dept_emp using(emp_no) 
join employees.departments using(dept_no);

select * 
from compare_salaries
where salary.to_date >= now();


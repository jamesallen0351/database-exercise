(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd001'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd002'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd003'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd004'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd005'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd006'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd006'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd007'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd008'
order by salary DESC
limit 1)
union
(select dept_no, salary, emp_no, first_name, last_name
from salaries
join dept_emp using(emp_no)
join employees using(emp_no)
where dept_no = 'd009'
order by salary DESC
limit 1);
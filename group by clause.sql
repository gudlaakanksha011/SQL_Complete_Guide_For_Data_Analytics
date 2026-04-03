use hr;

-- Aggregate functions
select sum(salary) from employees_details;
select avg(salary) from employees_details;
select sum(salary) as total_salary, avg(salary) as avg_salary, max(salary),min(salary) from employees_details;

-- get me department wise highest salary and total salary
select department_id,
max(salary) as highest_salary,
sum(salary) as total_salary,
count(employee_id) as no_of_emp
from employees_details
group by department_id;

-- get me department wise (where we have n departments) highest salary and total salary
select department_id,first_name,last_name,
max(salary) as highest_salary,
sum(salary) as total_salary,
count(employee_id) as no_of_emp
from employees_details
group by department_id,first_name,last_name;

-- get job_id based employee_cnt
select job_id,
count(employee_id) as no_of_emp
from employees_details
group by job_id;

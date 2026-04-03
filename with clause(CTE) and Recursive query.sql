use hr_oracle;

-- CTE(common table expressions) or With clause 
-- Get all the departments having the range of salary > 5000
select department_id, max(salary) as max_salary, min(salary) as min_salary, max(salary) - min(salary) as diff_salary 
from employees
group by department_id
having max(salary)- min(salary) > 5000;

-- Using cte
with diff_table as (select department_id, max(salary) as max_salary, min(salary) as min_salary, max(salary) - min(salary) as diff_salary 
from employees
group by department_id)
select * from diff_table
where diff_salary > 5000; 

-- using multiple cte's
with diff_table as (select department_id, count(*) as emp_count, max(salary) as max_salary, min(salary) as min_salary, max(salary) - min(salary) as diff_salary 
from employees
group by department_id),
emp_morethan_5 as (
select * from diff_table
where emp_count > 5)
select * from emp_morethan_5 
where diff_salary > 5000;

-- hirerachy using cte { works only in oracle}
with emp_hirerachy(emp_id,f_name,l_name) as 
(
-- Anchor member : selecting the initial employee 
select employee_id as emp_id, first_name as f_name, last_name as l_name
from employees
where employee_id = 100
union all
-- Recursive member : selecting the manager(s) of the employee
select b.employee_id as emp_id, b.first_name as f_name, b.last_name as l_name 
from emp_hirerachy a
join  employees b on a.emp_id = b.manager_id
)
select * from emp_hirerachy;

-- recursive query using CTE
with recursive cte(n) as
(
select 1
union all 
select n+1 from cte limit 1000
)
select * from cte;

with recursive emp_hirerachy(emp_id,mgr_id,f_name,l_name) as 
(
-- Anchor member : selecting the initial employee 
select employee_id as emp_id,manager_id as mgr_id, first_name as f_name, last_name as l_name
from employees
where employee_id = 100
union all
-- Recursive member : selecting the manager(s) of the employee
select b.employee_id as emp_id, manager_id as mgr_id, b.first_name as f_name, b.last_name as l_name 
from emp_hirerachy a
join  employees b on a.emp_id = b.manager_id
)
select * from emp_hirerachy;


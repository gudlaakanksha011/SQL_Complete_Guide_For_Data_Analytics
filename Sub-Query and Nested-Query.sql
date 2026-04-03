use hr_oracle;

-- create a sub-query
select a.*, (select department_name from departments b where b.department_id = a.department_id) as department_full_name
from employees a;

select a.*, (select avg(salary) from employees) as avg_salary
from employees a; 

-- sub-query inside subquery or NESTED QUERY (here we are using result of one sub-query inside other.
select * from
(select a.*, (select avg(salary) from employees) as avg_salary
from employees a) as emp_output
where salary - avg_salary > 0;

-- Nested Query
select * from employees
order by salary desc
limit 3;

select * from (select * from employees
order by salary desc) as top3_emp
limit 3;

-- Get all departments whose average salary >5000
select department_id, avg(salary) as avg_salary
from employees
group by department_id
having avg_salary > 5000;

-- Get all departments whose average salary >5000 without using having use SUBQUERY instead
select department_id, avg_salary from 
   (select department_id, avg(salary) as avg_salary from employees group by department_id)
as avg_salary 
where avg_salary> 5000;

-- SUB_QUERY using IN Clause
-- Get me all valid departments ids
select * from employees
where department_id in (select department_id from departments);

-- get me all Invalid department ids
select * from employees
where coalesce(department_id,9999) not in (select department_id from departments);


use hr_oracle;

-- ANALYTICAL NUMBERING (or) NUMBERING FUNCTION
-- ROW_NUMBER() :- its just gives the number/sequence in a window / partition

select emp.*,
row_number() over (partition by department_id order by salary desc) as row_no 
from employees emp;

-- RANK() :- its same as ROW_NUMBER() but gives the same rank when values are same/equal

select emp.*,
row_number() over (partition by department_id order by salary desc) as row_no,
rank() over (partition by department_id order by salary desc) as row_no
from employees emp;

-- DENSE_RANK() :- its same as RANK() but doesn't skip the rank for the next value, when the values are same/equal

select emp.*,
row_number() over (partition by department_id order by salary desc) as row_no,
rank() over (partition by department_id order by salary desc) as rank_no,
dense_rank() over (partition by department_id order by salary desc) as dense_rank_no
from employees emp;

select employee_id,department_id,salary,
row_number() over (partition by department_id order by salary desc) as row_no,
rank() over (partition by department_id order by salary desc) as rank_no,
dense_rank() over (partition by department_id order by salary desc) as dense_rank_no
from employees emp;

-- Find the 1st highest salary  in employees details in each department
-- 1st Approach
select emp.*,
max(salary) over (partition by department_id) as max_salary
from employees emp;

select department_id, employee_id,job_id,salary, max_salary from (
select emp.*,
max(salary) over (partition by department_id) as max_salary
from employees emp) as emp_temp
where salary = max_salary;

-- 2nd Approach
select department_id, employee_id,job_id,salary, salary_rank from (
select emp.*,
rank() over (partition by department_id order by salary desc) as salary_rank
from employees emp) as emp_temp
where salary_rank = 1;

-- Find the highest salary among the employees
-- 1st approach
select * from employees
where salary = (select max(salary) from employees);
-- 2nd approach
select * from (
select emp.*,
rank() over (order by salary desc) as highest_salary
from employees emp) as emp_temp
where highest_salary = 1;

-- Find the second highest salary among the employees
-- 1st approach
select * from employees
where salary = (
   select (max(salary)) from employees 
   where salary <> (select max(salary) from employees));
   
-- 2nd approach
select * from (
select emp.*,
rank() over (order by salary desc) as highest_salary
from employees emp) as emp_temp
where highest_salary = 2;



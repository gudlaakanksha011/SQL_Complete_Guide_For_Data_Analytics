use hr;
select * from employees_details;
-- filtering the aggregate by unsing having 
select department_id,
count(employee_id) as no_of_emp
from employees_details
group by department_id;

-- get me all the departments where count is more than 10
select department_id,
max(salary) as highest_salary,
sum(salary) as total_salary,
count(employee_id) as no_of_emp
from employees_details
group by department_id
having no_of_emp > 10;

-- get me all the departments where salary >15000 and count is more than 10
select department_id,
count(employee_id) as no_of_emp
from employees_details
where salary > 15000
group by department_id
having no_of_emp > 10;

-- get me all the departments where salary >15000 and sum of salary is > 1000000
select department_id,
sum(salary) as total_salary
from employees_details
where salary > 15000
group by department_id
having sum(salary) > 1000000;

update employees_details
set email_id = null 
where employee_id = 1211;
commit;
rollback;
-- handing Nulls in tables 
select count(*) from employees_details
where email_id is null; 
select * from employees_details
where email_id is not null; 

-- substitute nulls with some values
select count(*) from employees_details
where email_id like '%@gmail.com'
or email_id is null;

-- substitute/replacing nulls with some values
select employee_id, coalesce(email_id,"Email id doesnt Exists") as id from employees_details;



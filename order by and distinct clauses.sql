use hr;
-- sorting using order clause 
select * from employees_details
order by employee_id;

select * from employees_details
order by employee_id desc;

select * from employees_details
order by employee_id asc;

-- sorting multiple columns
select * from employees_details
order by department_id asc, employee_id asc;

select * from employees_details
order by department_id asc, employee_id desc;

-- sorting based on column positions
select * from employees_details
order by 1, 2, 3;

update employees_details
set salary = employee_id *10;
select * from employees_details
order by 2, 1 desc;

-- get top 3 employees by highest salaries
select * from employees_details
order by salary desc
limit 5;

-- DISTINCT KEYWORD TO FETCH UNIQUE VALUES FROM SINGLE/MORE THAN ONE COLUMN

-- GET me all the departments_ids from employees_details
select department_id from employees_details;
select distinct department_id from employees_details;
select distinct first_name,last_name from employees_details;
select distinct a.* from employees_details a; 






 



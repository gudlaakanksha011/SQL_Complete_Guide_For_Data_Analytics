use hr;
-- get list of databases on the current database
show databases;
-- get tables from a databases
show tables from hr;
-- get columns from tables
show columns from employees_details;
show index from hr.employees_details;

select * from information_schema.tables;

-- UUID fro tagging row in table
select uuid() 
as row_num,a.* from employees_details a;

-- limit no.of rows
select * from employees_details
limit 10;

-- filtering(where clause) records using logical conditions
select * from employees_details
where department_id = 431;

select * from employees_details
where salary > 15000;

select * from employees_details
where salary >= 14000;

select * from employees_details
where job_id < 120;

select * from employees_details
where job_id <= 120;

select * from employees_details
where job_id < 125 and salary > 15000;

select * from employees_details
where first_name = 'son' or job_id >= 120;

select * from employees_details
where first_name = 'son' and job_id >= 120;

select * from employees_details
where department_id between 430 and 440;

select * from employees_details
where department_id != 431;

select * from employees_details
where department_id <> 431;

select * from employees_details
where not(department_id = 431);


-- filtering using In operator
select * from employees_details
where employee_id in (1254,1256,1259);

-- filtering using LIKE operator
select * from employees_details
where first_name LIKE 'son';

select * from employees_details
where first_name LIKE 'son%';

select * from employees_details
where first_name LIKE '%a';

select * from employees_details
where first_name LIKE '%o%';

select * from employees_details
where first_name not LIKE '%o%';



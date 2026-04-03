-- DQL commands --
use hr;
select * from employees_details;

-- DML commands --
-- insert single row --

insert into employees_details values(1234,"son","moon",current_timestamp,120,10000,0.5,321,431,"son.moon@gmail.com");
insert into employees_details values(1235,"sony","monal","2026-03-30 12:00:00",110,13450,0.5,321,430,"sony.monal@gmail.com");

-- insert into single row using coulmns --
insert into employees_details(first_name,last_name,salary,job_id,hire_date,employee_id,manager_id, department_id,commission_pct,email_id)
values("Chandu","Dumala",12000,1212,current_timestamp,12120,121212,121210,0.2,"Chandu.dumala@gmail.com");

-- insert duplicate employee id (employee _id is a primary key) throws error --
insert into employees_details values(1234,"song","moon",current_timestamp,120,10000,0.5,321,431,"song.moon@gmail.com");

-- insert null value into job id
insert into employees_details values(1211,"son","moon",current_timestamp,null,10000,0.5,321,431,"son.moon@gmail.com");

-- insert multiple row into columns
insert into employees_details values(1211,"son","moon",current_timestamp,120,10000,0.5,321,431,"son.moon@gmail.com"),
(12110,"soni","moong",current_timestamp,120,10000,0.5,321,431,"soni.moong@gmail.com"),(12111,"song","moon",current_timestamp,120,10000,0.5,321,431,"song.moon@gmail.com"),
(12112,"sonia","moonis",current_timestamp,120,10000,0.5,321,431,"sonia.moonis@gmail.com");

-- table Aliasing --
select employee_id,salary from employees_details;
select emp.* from employees_details emp;
select emp.employee_id from employees_details emp;

-- insert into table using select
insert into employees_details
select emp.employee_id+20,first_name,last_name,hire_date,job_id,salary,commission_pct,manager_id,department_id,email_id from employees_details emp;

insert into employees_details select emp.employee_id+25,first_name,last_name,hire_date,job_id,salary,commission_pct,manager_id,department_id,email_id from employees_details emp;

-- Update in selected rows (without any condition)
select * from employees_details;
update employees_details
set salary = salary+(salary*0.1);

-- cross verfiying the update 
select employee_id, salary,salary+(salary*0.1) from employees_details;

-- get count of records in a table
select count(*) from employees_details;
select * from employees_details where salary < 14000;

-- update in selcted row (with condition) usine where clasue which filters the rows
select * from employees_details where salary < 14000;
update employees_details
set salary = salary+(salary*0.1)
where salary < 14000;

-- update in selcted row (with condition) usine where clasue which filters the rows 
-- update salary for employees gretaher than 14000 with the average value of that category
select * from employees_details where salary > 14000;
update employees_details
set salary = (select avg(salary) from employees_dtls where salary >14000)
where salary > 14000;

select avg(salary) from employees_details where salary >14000;

-- create a dummy table and update
create table employees_dtls as select * from employees_details;

-- Delete records using delete commands
delete from employees_dtls;
select * from employees_details where department_id = 430;

-- Delete row based on condition
delete from employees_details where department_id = 430;







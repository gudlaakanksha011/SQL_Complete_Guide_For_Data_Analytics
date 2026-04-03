use hr_oracle;

-- union/union all/union distinct 
-- it is similar to append in excel power query
-- vertical join/append one on top of other

-- UNION { it only allows distinct records and removes duplicates}
select * from employees
union
select * from employees; 

select count(*) from (select * from employees union select * from employees) as emp;

-- UNION ALL { Allows duplicates }
select count(*) from (select * from employees union all select * from employees) as emp;

-- union distinct 
select count(*) from (select * from employees union distinct select * from employees) as emp;

-- UNION all using specific row
-- In union same data type should be appended /union
-- should have same no.of columns in union
select employee_id,first_name,last_name from employees
union all
select first_name,employee_id,last_name from employees;

-- union using where clause
select employee_id,first_name,last_name from employees
where department_id = 50
union all
select first_name,employee_id,last_name from employees
where department_id = 50;

-- better way to use union in complex query
select * from (
select department_id, count(*) from employees
group by department_id
order by department_id) as emp
union all
select * from (
select department_id, count(*) from employees
group by department_id
order by department_id) as emp1;

-- INTERSECT { WORKS only in ORACLE} in my sql we can do this using join
-- Get me department whose no.of employees are more than 3 and also the department belongs to location_id = 1700
select * from (select department_id from hr.employees
group by department_id
having count(*) > 3)
intersect 
select department_id from hr.departments 
where location_id = 1700;

-- MINUS { WORKS only in ORACLE} in my sql we can do this using join
-- Get me department whose no.of employees are more than 3 minus department where the avg(salary) < 5000
select * from (select department_id from hr.employees
group by department_id
having count(*) > 3)
minus
select department_id from hr.departments 
group by department_id
having avg(salary) < 5000;








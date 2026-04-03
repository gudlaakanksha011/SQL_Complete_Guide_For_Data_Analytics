use hr_oracle;
-- EXISTS/ NOT EXISTS (correlated Query)

-- EXISTS
-- validate if all the departments in employee table are part of departments tables
select * from employees emp
where exists (select * from departments dept where emp.department_id = dept.department_id);

select * from employees
where department_id in (select department_id from departments dept);

-- NOT EXISTS 
select * from employees emp
where not exists (select * from departments dept where coalesce(emp.department_id,999) = dept.department_id);

select * from employees
where coalesce(department_id,998) not in (select department_id from departments dept);

-- ALL/ANY
-- Find employees whose salary is greater than atleast one employee in their own department
select * from employees emp1
where salary > ANY ( select salary from employees emp2 where emp1.department_id = emp2.department_id);

-- Find employees whose salary is greater than all other employees in their own department
select * from employees emp1
where salary > ALL ( select salary from employees emp2 where emp1.department_id = emp2.department_id);

select * from employees emp1
where salary >= ALL ( select salary from employees emp2 where emp1.department_id = emp2.department_id);

select * from employees emp1
where salary > ALL ( select salary from employees emp2 where emp1.department_id = emp2.department_id and emp1.employee_id <> emp2.employee_id);



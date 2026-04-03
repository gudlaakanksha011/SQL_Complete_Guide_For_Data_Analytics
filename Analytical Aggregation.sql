use hr_oracle;
-- ANALYTICAL/WINDOW FUNCTION
-- ANALYTICAL AGGREGATE FUNCTIONS

-- Get me the difference between each employee's salary with average dept salary

-- NON ANALYTICAL APPROACH
select * from employees emp
left join 
(select department_id, avg(salary) as avg_salary
from employees
group by department_id) as dept_avg
on emp.department_id = dept_avg.department_id;

select * from employees emp
left join 
(select coalesce(department_id,999) as department_id, avg(salary) as avg_salary
from employees
group by department_id) as dept_avg
on coalesce(emp.department_id,999) = dept_avg.department_id;

select emp.*, salary - avg_sal as diff_sal from employees emp
left join 
(select coalesce(department_id,999) as department_id, avg(salary) as avg_sal
from employees
group by department_id) as dept_avg
on coalesce(emp.department_id,999) = dept_avg.department_id;

-- ANALYTICAL APPROACH
select emp.*,
avg(salary) over (partition by department_id) as avg_sal
from employees emp;

-- GET me list of all employees and their salary difference with that of the employee who has maximum salary in that department
select emp.*,
max(salary) over (partition by department_id) as max_sal
from employees emp;

select emp.*,
salary - (max(salary) over (partition by department_id)) as diff_sal
from employees emp;

-- how many employees have salary above their department avg salary
select * from (
select emp.*,
salary - (avg(salary) over (partition by department_id)) as diff_sal
from employees emp) as temp_emp
where diff_sal > 0;

-- What is the cummulative sum of salry of employee each and every month from the beginning of the year 
-- get me cummulative sum of salary for each employee by department based on their joining date
select emp.*,
sum(salary) over (partition by department_id order by hire_date asc) as cum_sal
from employees emp; 

select emp.*,
sum(salary) over (partition by department_id) as sum_sal,
sum(salary) over (partition by department_id order by hire_date asc) as cum_sal
from employees emp;


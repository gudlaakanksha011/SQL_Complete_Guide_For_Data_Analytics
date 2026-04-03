use hr_oracle;
-- ANALYTICAL NAVIGATION
-- Get me each employees salary and the difference between the next joining employees salary in the department
select department_id, employee_id, salary,hire_date,
lead(salary,1) over (partition by department_id order by hire_date asc) as next_salary,
salary - lead(salary,1) over (partition by department_id order by hire_date asc) as diff_next_salary,
lag(salary,1) over (partition by department_id order by hire_date asc) as previous_salary,
salary - lag(salary,1) over (partition by department_id order by hire_date asc) as diff_previous_salary 
from employees emp;

-- Get me all the employees and their salary difference with the first employee's salary in that department and last employees salary in the department
select department_id, employee_id, salary,hire_date,
first_value(salary) over (partition by department_id order by hire_date asc) as first_emp_salary,
last_value(salary) over (partition by department_id 
        order by hire_date asc rows between unbounded preceding and unbounded following) as last_emp_salary
from employees emp;
use hr_oracle;
select * from employees;
SELECT a.*,
    CASE 
        WHEN salary < 10000 THEN 'Low'
        WHEN salary >= 10000 AND salary <= 20000 THEN 'Medium'
        WHEN salary > 20000 THEN 'High'
        ELSE 'Invalid salary'
    END AS salary_category
FROM employees a;

-- where cause in case 
select * from employees
where (case when salary < 10000 then 'Low'
			when salary >= 10000 and salary <= 20000 then 'Medium'
            when salary < 20000 then 'High'
            else 'Invalid salary'
	   end) in ('Medium','High');
       
select * from employees
where (case when salary < 10000 then 'Low'
			when salary >= 10000 and salary <= 20000 then 'Medium'
            when salary < 20000 then 'High'
            else 'Invalid salary'
	   end) = 'Medium';


-- Group by clause in case using aliasing 
select (case when salary < 10000 then 'Low'
			when salary >= 10000 and salary <= 20000 then 'Medium'
            when salary < 20000 then 'High'
            else 'Invalid salary'
	   end) as salary_category,count(*) as emp_count from employees
group by (case when salary < 10000 then 'Low'
			when salary >= 10000 and salary <= 20000 then 'Medium'
            when salary < 20000 then 'High'
            else 'Invalid salary'
	   end);
       
select a.*, case when department_id = '20' then 'HR'
                 when department_id = '80' then 'Engineering'
                 when department_id = '80' then 'Finance'
                 else 'support'
			end as department_name from employees a;

-- Second method in Case statements
select a.*,
case job_id when 'AD_PRES' then 'President'
            when 'AD_VP' then 'Vice President'
            when 'IT_PROG' then 'IT Programmer'
            when 'FI_MGR' then 'Finance Manager'
            else 'Others'
end as department_name
from employees a;

       
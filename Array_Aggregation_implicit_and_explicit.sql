use co;

-- ARRAY AGGREGATIONS
-- Get me all the list of possible job_ids comma separated in each department?

select department_id,group_concat(distinct job_id)
as list_of_jobs
from hr_oracle.employees
group by department_id;

-- CAST (used to change the type of data) --explicit
select cast("11:35:00" as YEAR), cast(TIME "11:35:00" as YEAR);

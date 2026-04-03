use hr_oracle;
-- DATE and TIME functions

-- now()
select now();

-- current_date() , current_time , {current_timestamp(is almost like now())}
select current_date(), current_time(),current_timestamp();

-- date add() and date sub()
select hire_date,
date_add(hire_date, INTERVAL 1 day) as hire_date_plus_1day,
date_add(hire_date, INTERVAL 1 month) as hire_date_plus_1month,
date_add(hire_date, INTERVAL 1 year) as hire_date_plus_1year,
date_sub(hire_date, INTERVAL 1 day) as hire_date_minus_1day,
date_sub(hire_date, INTERVAL 1 month) as hire_date_minus_1month,
date_sub(hire_date, INTERVAL 1 year) as hire_date_minus_1year
from employees;

-- Get me all employees details who were hired in lastt 1month(30 days)
select * from employees
where hire_date >= date_sub(current_date(),INTERVAL 30 day) and 
hire_date < current_date();

select * from employees
where hire_date >= date_sub('2000-04-30',INTERVAL 30 day) and 
hire_date < current_date();

select hire_date, hire_date+100 from employees; -- this adds 100days to the date in oracle, here it is implicity conversation

select hire_date, hire_date+100, date_add(hire_date, INTERVAL 100 day) from employees; -- this works in mysql here it is explicity conversion

-- last_day()
select last_day(now());

select hire_date, last_day(hire_date) from employees;

-- date_format()
select * from employees
where date_format(current_date(),'%y,%m,-01');

select date_format(current_date(),'%y,%m,-01'),date_format(current_date(),'%y-01-01'),current_date();

select date_format(current_date(),'%y-%m,-01'),date_format(current_date(),'%y-01-01'),current_date(),
date_format(current_date(),'%y-%m-%d'),date_format(current_date(),'%d-%m-%y(%W)');

select sysdate, trunc(sysdate,'DD'), trunc(sysdate,'MM'), trunc(sysdate,'YYYY'); -- this works in oracle

-- STR_TO_DATE() 
select str_to_date('08-13-2025','%d/%m/%y');
select STR_TO_DATE('6/18/2005', '%m/%d/%y');
select date_add(STR_TO_DATE('6/18/2005', '%m/%d/%y'), interval 10 day);

-- EXTRACT()
select extract(year from current_date()),
extract(month from current_date()),
extract(day from current_date()),
extract(hour from current_time()),
extract(minute from current_time());

-- DATEDIFF()
select datediff(current_date,hire_date)/365 from employees;

-- FROM_UNIXTIME()
select from_unixtime(1447430881);
select from_unixtime(726863400);

-- unix_timestamp()
select unix_timestamp(hire_date) from employees;

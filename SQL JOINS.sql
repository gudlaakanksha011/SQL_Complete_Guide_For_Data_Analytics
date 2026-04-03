create table table1
(
emp_id int,
dept_id varchar(50)
);
create table table2
(
emp_id int,
salary int
);
drop table table3;
create table table3
(
emp_id int,
name varchar(50)
);

insert into table1 values (10,"Eng"),(20,"HR"),(30,"IT"),(40,"FInance");
select * from table1;
insert into table2 values (10,5000),(20,6000),(50,7000),(60,8000);
select * from table2;
insert into table3 values (10,"ANIL"),(20,"BHANU"),(30,"UMA"),(40,"PINKY"),(50,"ANILA"),(60,"SAI CHANDU");
select * from table3;

-- INNER JOIN OR JOIN
select * from table1 a
inner join table2 b
on a.emp_id = b.emp_id;

select a.emp_id, dept_id,salary
from table1 a 
inner join table2 b
on a.emp_id = b.emp_id;

-- LEFT JOIN 
select * from table1 a
left join table2 b
on a.emp_id = b.emp_id;

select a.emp_id, dept_id,salary
from table1 a 
left join table2 b
on a.emp_id = b.emp_id;

-- RIGHT JOIN 
select * from table1 a
right join table2 b
on a.emp_id = b.emp_id;

select a.emp_id, dept_id,salary
from table1 a 
right join table2 b
on a.emp_id = b.emp_id;

-- LEFT ANTI JOIN (OR) LEFT OUTER JOIN{LEFT JOIN EXCLUDING INNER JOIN}
select * from table1 a
left join table2 b
on a.emp_id = b.emp_id
where b.emp_id is null;

-- RIGHT ANTI JOIN (OR) RIGHT OUTER JOIN {RIGHT JOIN EXCLUDING INNER JOIN}
select * from table1 a
right join table2 b
on a.emp_id = b.emp_id
where a.emp_id is null;

-- FULL JOIN (or) FULL OUTER JOIN { " Works only in oracle " }
select * from table1 a
full join table2
on a.emp_id = b.emp_id;

-- CROSS JOIN
select * from table1 a
cross join table2 b;

select * from table1 a
left join table2 b
on a.emp_id = b.emp_id
left join table3 c
on a.emp_id = c.emp_id;

select * from departments a 
left join (
select department_id, count(*) as emp_cnt 
from employees
group by department_id) b
on a.department_id = b.department_id ;


-- LEFT JOIN using CTE's
with cte1 as (select a.emp_id as t1_emp_id,dept_id,a.emp_id as t2_emp_id,salary from table1 a
left join table2 b
on a.emp_id = b.emp_id)
select * from cte1 c
left join table3 d
on c.t1_emp_id = d.emp_id;




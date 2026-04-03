use hr_oracle;
select * from employees;

-- String functions
-- Concat 
select concat(first_name,"",last_name) as full_name from employees;

-- concat with delimiter
select concat_ws('@',concat(first_name,"",last_name),'gmail.com') as email_id from employees;

-- LTRIM removes spaces from the left
-- RTRIM removes spaces from right
-- Trim removes all spaces
select LTRIM("  under  "),
RTRIM("  under  "),
TRIM("  under  ");

select length(LTRIM("  under  ")),
length(RTRIM("  under  ")),
length(TRIM("  under  "));

-- LPAD/ RPAD 
select lpad("123456",16,0), rpad("123456",16,0);

-- replace
select replace(job_id,"PROG","ENG") from employees;

-- SUB STRING 
select substr("iam a good girl",1,5);

-- INStr
select instr("steve.king@gmail.com","@");

select substr("steve.king@gmail.com",1, instr("steve.king@gmail.com","@")-1) as email_name,
substr("steve.king@gmail.com",instr("steve.king@gmail.com","@")+1) as email_domain,
substr("steve.king@gmail.com",1,instr("steve.king@gmail.com",".")-1) as first_name,
substr("steve.king@gmail.com",instr("steve.king@gmail.com",".")+1, 
instr("steve.king@gmail.com","@")- instr("steve.king@gmail.com",".")-1)as last_name;

-- REGEX 
select regexp_instr('abc 123','[0-9]');
select regexp_instr('12345 #3np 234', '[a-z][A-Z][0-9]');
select regexp_replace('abc #3np 234', 'm|2',"@");
select regexp_substr('abc123xyz','[0-9]+');

-- Soundex (looks for the similar sounded words)
select soundex('gmail.com'), soundex('gmial.com'),soundex('gmaail.com');

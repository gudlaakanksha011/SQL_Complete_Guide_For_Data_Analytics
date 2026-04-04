-- create a table using sequence/auto_increment
create table hr_oracle.table_temp
(
emp_id int auto_increment primary key,
emp_name varchar(50)
);
use hr_oracle;
select * from hr_oracle.table_temp;
insert into table_temp (emp_name) values('praveen');
insert into table_temp (emp_name) values('Ram');

-- Create index for a table
-- indexes are used to retrieve the data for a particular column
-- BTree indexes are used in Warehouse
-- bitmap indexes are used in OLTP
create index ph_indx on hr_oracle.employees (phone_number);

-- create a trigger
create table hr_oracle.account (acct_num INT,amount DECIMAL (10,2));
use hr_oracle;
create trigger ins_sum before insert on account
for each row set @sum = @sum + new.amount;

create trigger update_trig before update on account
for each row set new.amount = new.amount + old.amount;

set @sum = 0;
insert into account values (1234,50000);
insert into account values (1234,10000);
select @sum as 'total amount inserted';
update account
set amount = 2000;
select * from account;

-- create a function
create function greeeting (input_name char(20))
returns char(50) deterministic return concat('Hello, ',input_name,'!');
select greeeting('praveen');

DELIMITER //

CREATE FUNCTION sal_increment (inp_sal INT, band VARCHAR(10))
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE output_sal INT;
    
    IF band = 'A' THEN
        SET output_sal = inp_sal + (inp_sal * 0.1);
    ELSEIF band = 'B' THEN 
        SET output_sal = inp_sal + (inp_sal * 0.05);
    ELSEIF band = 'C' THEN  -- Changed from 'B' to 'C'
        SET output_sal = inp_sal + (inp_sal * 0.03);
    ELSE
        SET output_sal = inp_sal; -- Default if no band matches
    END IF; -- Added missing semicolon

    RETURN output_sal; -- Corrected from 'outputt_sal'
END //

DELIMITER ;

-- Test the function
SELECT sal_increment(10000, 'A') AS incremented_salary;

-- create procedure
DELIMITER //
CREATE PROCEDURE citycount (IN country CHAR(3), OUT cities INT)
BEGIN
    -- 2. Ensure the SELECT INTO structure is clean
    SELECT COUNT(*) INTO cities 
    FROM world.city
    WHERE CountryCode = country;
END //  -- 3. The // here tells MySQL the procedure definition is done

-- 4. Reset the delimiter back to semicolon
DELIMITER ;

DELIMITER //
drop procedure emp_cnt;
CREATE PROCEDURE emp_cnt (IN dept int, OUT emp_cnt INT)
BEGIN
    -- 2. Ensure the SELECT INTO structure is clean
    SELECT COUNT(*) INTO emp_cnt 
    FROM hr_oracle.employees
    WHERE department_id = dept;
END //  -- 3. The // here tells MySQL the procedure definition is done

-- 4. Reset the delimiter back to semicolon
DELIMITER ;
call emp_cnt(50,@emp_cnt);
select @emp_cnt;



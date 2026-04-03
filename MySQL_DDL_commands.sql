-- below statement creates databse or schema
create schema hr;

-- below statement uses hr data
use hr;

-- below statemnet creates a hr table
CREATE TABLE hr.employees (
    employee_id     INT PRIMARY KEY  AUTO_INCREMENT, 
    first_name      VARCHAR(20), 
    last_name       VARCHAR(25) NOT NULL, 
    phone		BIGINT,
    hire_date       DATETIME NOT NULL 
	         DEFAULT CURRENT_TIMESTAMP, 
    job_id          VARCHAR(10) NOT NULL, 
    salary          DECIMAL(8,2) NOT NULL CHECK (salary > 0), 
    commission_pct  DECIMAL(2,2), 
    manager_id      INT, 
    department_id   INT
);
-- Alters the table adding new column
ALTER TABLE employees ADD COLUMN email varchar(100);
 
-- drop columns using alter
ALTER TABLE employees DROP COLUMN phone;

-- modify a column using alter
ALTER TABLE employees MODIFY COLUMN first_name VARCHAR(30);

-- RENAME A column using ALTERALTER TABLE employees RENAME COLUMN email to email_id;

-- Rename entire table (Becareful) using 
ALTER TABLE employees RENAME TO employees_details;

-- drops table
drop table employees_details;

-- TRUNCATE A TABLE(ddl) ** VERY IMP 
TRUNCATE TABLE employees_details;



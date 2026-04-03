use hr;
-- DCL commands
GRANT INSERT, UPDATE, SELECT, DELETE on hr.employees_dtls to 'Akanksha_011'@'localhost';
GRANT INSERT, UPDATE, SELECT, DELETE on hr.employees_details to 'Akanksha_011'@'localhost';
REVOKE UPDATE,DELETE on hr.employees_dtls from 'Akanksha_011'@'localhost';

-- TCL commands
select * from employees_dtls;
select count(*) from employees_dtls;

insert into employees_dtls
values(12112,"sonia","moonis",current_timestamp,120,10000,0.5,321,431,"sonia.moonis@gmail.com");
ROLLBACK;
commit;
-- transcation starts from here
insert into employees_dtls
values(02112,"sonia","moonis",current_timestamp,120,10000,0.5,321,431,"sonia.moonis@gmail.com");
insert into employees_dtls
values(1052112,"sonia","moonis",current_timestamp,120,10000,0.5,321,431,"sonia.moonis@gmail.com");
commit;
select count(*) from employees_dtls;
insert into employees_dtls
values(1216512,"sonia","moonis",current_timestamp,120,10000,0.5,321,431,"sonia.moonis@gmail.com");
rollback;
select * from employees_dtls;

-- SAVEPOINT
-- set 1 insert row
insert into employees_dtls
values(12812,"sonia","moonis",current_timestamp,120,10000,0.5,321,431,"sonia.moonis@gmail.com");
savepoint row_31;

-- set 2
insert into employees_dtls
values(16512,"sonia","moonis",current_timestamp,120,10000,0.5,321,431,"sonia.moonis@gmail.com");
insert into employees_dtls
values(512,"sonia","moonis",current_timestamp,120,10000,0.5,321,431,"sonia.moonis@gmail.com");
savepoint row_38;
rollback to savepoint row_31;
select count(*) from employees_dtls;
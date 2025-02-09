create database test2;
USE test2;
create table table1(employeeId int primary key,firstName varchar(20) , lastName varchar(20) , email varchar(30) ,bod date);

insert into table1(employeeID,firstName,lastName,email,bod)values(1, 'Ahmed', 'Ali', 'ahmed.ali@example.com', '1992-06-01');
insert into table1(employeeID,firstName,lastName,email,bod)values(2, 'Sara', 'Mohamed', 'sara.moh@example.com', '1989-12-15');

select * from table1 ;
select employeeID from table1;

update table1 set email='newEmail@gmail.com' where employeeId=1;
select * from table1 where employeeId=1;
select email from table1;

delete from table1 where employeeId=2;

select * from table1;

alter table table1 add salary decimal(10,2);
select * from table1;
--insert into table1(salary) values(350.5);

alter table table1
alter column email varchar(150);

alter table table1
drop column bod;
select * from table1;

insert into table1(employeeID,firstName,lastName,email)values(2, 'Sara', 'Mohamed', 'sara.moh@example.com');
select * from table1;

truncate table table1 ;
select * from table1;


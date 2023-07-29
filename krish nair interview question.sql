show databases;
create database krish_nair_interview;
show  databases;
use  krish_nair_interview;

create table emp_details (EMP_ID int ,GENDER varchar(10),EMAIL_ID varchar(30),DEP_ID int);
show tables;

-- table name is emp_detals 
desc emp_details;

-- drop table emp_detals;
-- bcz the table was not proper 
select * from emp_details;
insert into emp_details values (1001,'M','YYYY@GMAIL.COM',104);
insert into emp_details values (1002,'M','xxxx@GMAIL.COM',103);
insert into emp_details values (1003,'F','OOOOO@GMAIL.COM',102);
insert into emp_details values (1004,'F','MMMM@GMAIL.COM',101);
insert into emp_details values (1005,'M','NNNN@GMAIL.COM',104);
insert into emp_details values (1006,'M','UUUU@GMAIL.COM',102);
insert into emp_details values (1007,'F','PPPP@GMAIL.COM',103);

select * from emp_details;


create table employee(
sr_no int,
E_name varchar(30),
E_ID int,
manager_name varchar(30),
division int);

select * from employee;
insert into employee values (1,'mama',1001,'rakesh',1);
insert into employee values (2,'mami',901,'rakesh',1);
insert into employee values (3,'koushil',801,'subas',1);
insert into employee values (4,'mom',607,'sushil',1);
insert into employee values (5,'dad',504,'Das',1);
insert into employee values (6,'bigbro',876,'MV',1);


select * from emp_details;
select * from employee;

select E_name from employee where E_ID >800;
select * from employee;

update employee set E_name='KP' where E_ID=901;
select * from employee;


select e1.*, e2.* from emp_details e1  ,employee e2 where e1.EMP_ID=e2.E_ID;
select * from emp_details e1 inner join employee e2 on e1.EMP_ID=e2.E_ID;

select * from employee where E_ID> 101 group by manager_name having division=1 order by E_ID limit 2 ;
select * from employee;

select left(E_name,2) from employee;


create table Credit_card(
creadit_card_no varchar(100),
merchant_id varchar(100),
card_limit int(10),
card_type varchar(20));

select * from Credit_card;

insert into Credit_card values (123456789,'uisrfhauifhi',100000,'M');
insert into Credit_card values (615461651,'mkjqwdniu',100000,'M');
insert into Credit_card values (156498498,'dewdwdwd',100000,'M');
insert into Credit_card values (184899495,'udewdwde',100000,'M');
insert into Credit_card values (165419156,'erivnfn',100000,'M');
insert into Credit_card values (215949846,'eniufdncid',100000,'M');
insert into Credit_card values (195849649,'enirufhnferi',100000,'M');


select left(creadit_card_no,5) from Credit_card;
select concat(left(creadit_card_no,5),"*****") from Credit_card;
select substr(creadit_card_no,3,6) as new_col from Credit_card;
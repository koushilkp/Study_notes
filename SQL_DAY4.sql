use db_test;
-- limit : limits the number of rows in output
-- limit(offset, no of rows to read)
-- rows from 7 to 15 :  select * from table_name limit 6,9;
-- group by : creates groups of data based on simillar values
select * from dept;
-- group data based on travel require information
select travel_required,count(empid) from dept group by travel_required;
-- where  : applied on row level data
-- having : applied on grouped data
-- select from where group by having order by limit
-- subqueries : query within query 
-- second highest salary
select max(salary) from emp where salary < (select max(salary) from emp);
-- display details of an emp having max salary
-- nth highest salary
-- select distinct salary from emp order by salary desc limit n-1,1;
-- row_number(): to assign an index value to each row of the partition 
-- row_number() over ()
-- row_number() over (partition by column_name order by column_name) 

select empid,salary,row_number() over () as rn from emp_data;
select empid,salary,loc,dept_id,row_number() over (partition by loc,dept_id order by loc) as rn from emp_data;

select * from dept;

-- constraints : rules set on the data
-- not null, unique , primary key,foreign key ,default,check, auto increment
-- NOT NULL : makes sure that we will not have a null value in a column

create table emp_nn (empid int NOT NULL, fname varchar(10));
DESC EMP_NN;
DESC EMP;

Insert into emp_nn values(1001,'Rahul');
select * from emp_nn;
Insert into emp_nn values(null,'Rahul');

ALTER TABLE emp modify column empid int not null;
ALTER TABLE emp modify column empid int;

-- UNIQUE : dups are not allowed, null values are allowed
create table emp_unq (empid int, fname varchar(10),
CONSTRAINT my_uk UNIQUE(EMPID));

DESC EMP_UNQ;
insert into emp_unq values(1001,'Rahul');
select * from emp_unq;

insert into emp_unq values(1001,'Rahul');
insert into emp_unq values(null,'Rahul');

alter table emp ADD CONSTRAINT my_uk UNIQUE(EMPID);
DESC EMP;
alter table emp DROP CONSTRAINT my_uk;

-- PRIMARY KEY : 
-- used to identify a row uniquely 
-- only one primary key 
-- combination of not null and unique
-- it will not allow null as well as duplicates

create table emp_pk (empid int, fname varchar(10),
CONSTRAINT my_pk PRIMARY KEY(EMPID));
DESC EMP_PK;

INSERT INTO EMP_PK VALUES(1001,'RAHUL');
SELECT * FROM EMP_PK;

INSERT INTO EMP_PK VALUES(1001,'RAHUL');
INSERT INTO EMP_PK VALUES(NULL,'RAHUL');

-- FOREIGN KEY : 
/*
student      						course 
roll_no,stud_name,address			course_id,course_name,roll_no
101      Rahul    pune				10, testing ,101
roll_no : primary key 				roll_no (foreign key)
parent table 						child table
referenced table					referencing table
*/

create table student (roll_no int , stud_name varchar(10), address varchar(15),
primary key (roll_no));
desc student;

create table course (course_id int, course_name varchar(15),roll_no int,
foreign key (roll_no) references student(roll_no)); 




	








SHOW DATABASES;
create database db_test;
USE db_test;
create table emp (empid int , fname varchar(10),salary int, loc varchar(10));
desc emp;

INSERT INTO emp (empid,fname,salary,loc) values (1001,'rahul',50000,'pune');
INSERT INTO emp values (1002,'rohit',40000,'mumbai');
INSERT INTO emp (empid,fname,salary) values (1002,'rohit',40000);
INSERT INTO emp values 
(1003,'virat',70000,'mumbai'),
(1004,'ashish',50000,'pune');

SELECT * FROM EMP;
SELECT empid,fname FROM emp;

SELECT * FROM emp where empid=1001;
select * from emp where empid=1002;
SELECT * FROM emp where loc='pune';
SELECT * FROM emp where empid=1001 AND empid=1003;
SELECT * FROM emp where empid=1001 OR empid=1003;
SELECT * FROM emp where empid IN (1003,1004);
SELECT * FROM emp where empid NOT IN (1002,1003,1004);
SELECT * FROM emp where salary >40000;
SELECT * FROM emp where salary <40000;
SELECT * FROM emp where salary <=40000;
SELECT * FROM emp where salary >=40000;
SELECT * FROM emp where salary BETWEEN 50000 and 70000; -- both start and end values are included 
SELECT * FROM emp where loc IS NULL;
SELECT * FROM emp where loc IS NOT NULL;

SELECT salary,0.25*salary as per_sal FROM emp;

SELECT salary,0.25*salary as per_sal FROM emp where 0.25*salary>15000;

select * from emp;
UPDATE emp set loc ='chennai';
UPDATE emp set loc ='chennai'where empid=1001;
UPDATE emp set loc ='pune' where empid=1002;
UPDATE emp set loc ='mumbai' where fname ='koushil'

ALTER TABLE emp ADD COLUMN contact int;       --EOP error 1604
ALTER TABLE emp MODIFY COLUMN contact varchar(10);
ALTER TABLE emp RENAME COLUMN contact to contact_info;
ALTER TABLE emp DROP COLUMN contact_info;

-- delete data
TRUNCATE TABLE emp; -- delete entire data from a table
DELETE FROM emp ; -- deletes entire data
DELETE FROM emp where empid=1002;
select * from emp;

-- import a csv file into a db table
SELECT * FROM emp_data;

select * from emp;
select * from emp_data;
select * from emp_data order by loc;
select * from emp_data order by loc desc;
select * from emp_data order by loc desc,salary desc;

-- DISTINCT : 
-- used to fetch the unique values of a column
select DISTINCT loc from emp_data; --  --DALLAS,CHICAGO,NEW YORK-- 

-- AGGREGATE FUNCTIONS : 
-- sum,avg,min,max,count
select sum(salary) from emp;
select avg(salary) from emp;
select min(salary) from emp;
select max(salary) from emp;

-- count : used to get the no of rows 
select * from emp_data;
select count(*) from emp_data;
select count(1) from emp;
select count(empid) from emp;
select count(loc) from emp; -- excludes null values 
select * from emp;

select * from emp_data limit 5;
select * from emp_data limit 4,6;

-- fetch records from 10 to 20
select * from emp_data limit 9,11;

-- fetch rows from 40  to 45
select * from emp_data limit 39,6;

-- 6th record from a table
select * from emp_data limit 5,1;

select count(empid) from emp_data where loc='dallas';
select count(empid) from emp_data where loc='chicago';
select count(empid) from emp_data where loc='new york';

select count(empid) from emp_data;
select loc,count(empid) from emp_data group by loc;
select loc,gender,count(empid) from emp_data group by loc;
select loc,gender,count(empid) from emp_data group by loc,gender;
select loc,gender,count(empid) from emp_data group by loc,gender order by loc;

-- display sum of salaries, count of emp where salary <50000 for each dept
select dept_id,sum(salary),count(empid) from emp_data where salary <50000 group by dept_id;

-- having : filter out the groups 
-- to have only groups where count of emp <3
select dept_id,sum(salary),count(empid) from emp_data where salary <50000 group by dept_id
having count(empid)<3 order by dept_id desc limit 1;
-- select , from ,where , group by , having , order by , limit

-- display the details of an emp having this max salary
select max(salary) from emp_data ;
select * from emp_data where salary=197537;
select * from emp_data where salary=(select max(salary) from emp_data); 

 -- to fetch the second highest salary
 select * from emp where salary <(select max(salary) from emp) ;
select * from emp where salary <(select max(salary) from emp) limit 1;
select *,max(salary) from emp where salary <(select max(salary) from emp);
select * from emp;

-- limit 
-- 3rd highest salary
select distinct salary from emp order by salary desc limit 2,1;

-- details of an emp having third highest salary
SELECT * from emp where salary =
(select distinct salary from emp order by salary desc limit 2,1);
select * from emp;

create view emp_view as select fname,salary,loc from emp;

select dept_id,max(salary) over () as max_sal  from emp_data;
select dept_id,max(salary) over (partition by dept_id order by dept_id desc) as max_sal  from emp_data;

-- row_number() : assign an index value to each row
select empid, salary, row_number() over () as rn from emp_data;

select dept_id,empid, salary, row_number() over (partition by dept_id order by salary desc)
 as rn from emp_data;
 
  -- max 2 salaries from each partition
  select * from (
 select dept_id,empid, salary, row_number() over (partition by dept_id order by salary desc)
 as rn from emp_data
 ) SQ
 where rn <3;
 
  -- get the even no of rows 
 select * from (
 select dept_id,empid, salary, row_number() over ()
 as rn from emp_data
 ) SQ
 where rn%2=0;
 
 -- odd no of rows
 select * from (
 select dept_id,empid, salary, row_number() over ()
 as rn from emp_data
 ) SQ
 where rn%2!=0;
 
 -- where  : applied on row level data
-- having : applied on grouped data

-- constraints : rules set on the data
-- not null, unique , primary key,foreign key ,default,check, auto increment
-- NOT NULL : makes sure that we will not have a null value in a column

-- PRIMARY KEY : 
-- used to identify a row uniquely 
-- only one primary key 
-- combination of not null and unique
-- it will not allow null as well as duplicates

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
desc course;

-- inner join 
select * from tbl1 inner join tbl2 ON tbl1.col1=tbl2.col2;
select tbl1.* from tbl1 inner join tbl2 ON tbl1.col1=tbl2.col2;

select * from emp_data;
select * from dept;
select * from emp_data inner join dept ON emp_data.empid=dept.empid;
select emp_data.empid from emp_data inner join dept ON emp_data.empid=dept.empid;
select emp_data.empid,salary,travel_required from emp_data inner join dept ON emp_data.empid=dept.empid;

-- left join 
select * from tbl1 left join tbl2 ON tbl1.col1=tbl2.col2;
select emp_data.empid,dept.empid,salary,travel_required 
from emp_data left join dept ON emp_data.empid=dept.empid;

select count(*) from emp_data; -- 100
select count(*) from dept;  -- 37

-- right join 
select * from tbl1 right join tbl2 ON tbl1.col1=tbl2.col2;
select tbl1.col1,tbl2.col2 from tbl1 right join tbl2 ON tbl1.col1=tbl2.col2;

select emp_data.empid,dept.empid,salary,travel_required 
from emp_data right join dept ON emp_data.empid=dept.empid;

-- self join : joining a table with itself
select * from emp_data;
-- display employees who are managers
select * from emp_data e inner join emp_data d on e.empid=d.mgr_id;
select e.empid,d.mgr_id,e.salary from emp_data e inner join emp_data d on e.empid=d.mgr_id;
select * from db_dev.emp_data;
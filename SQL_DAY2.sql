-- introduction to mysql and sql
-- types of commands :
/*
DDL: CREATE,ALTER,TRUNCATE,DROP : only about struture
DML: INSERT,UPDATE,DELETE.      : only about data
DCL: GRANT ,REVOKE (DBA)
TCL: COMMIT,ROLLBACK,SAVEPOINT 
DQL: SELECT 
*/

-- CREATE DATABASE DB_NAME;
-- USE DB_NAME;
-- CREATE TABLE TBL_NAME (COL1 DTYPE,....COLN DTYPE)
DESC db_test.emp;
use db_test;
desc emp;

-- insert data
-- INSERT INTO table_name (columns) values (value set);
-- no of columns always should be equals to the number of values
/*
emp : table name
empid,fname,salary,loc
1001. Rahul 50000. pune 
*/

INSERT INTO emp (empid,fname,salary,loc) values (1001,'rahul',50000,'pune');
INSERT INTO emp values (1002,'rohit',40000,'mumbai');
INSERT INTO emp (empid,fname,salary) values (1002,'rohit',40000);

INSERT INTO emp values 
(1003,'virat',70000,'mumbai'),
(1004,'ashish',50000,'pune');

-- read data
-- * REPRESENTS ALL columns
-- FROM clause is used to specify a data source 
-- data source can be a table, view or a subquery

SELECT * FROM EMP; -- all columns of a table 
SELECT empid,fname FROM emp; -- read particular columns

-- where clause : 
-- used to filter out data in output , restricts the number of rows in output 
-- it gives only rows which satisfy the given filter criteria
-- where is always applied on a row level data

SELECT * FROM emp where empid=1001;
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

SELECT empid,salary,loc FROM emp where loc IS NOT NULL;

-- alias 
-- can be given to a column,to a table or to a subquery
-- display salaries of employees from emp table along with 25th % of salary
SELECT salary,0.25*salary as per_sal FROM emp;

-- per_salary>15000
SELECT salary,0.25*salary as per_sal FROM emp where 0.25*salary>15000;
-- import pandas as pd

-- CRUD : CREATE, READ,UPDATE,DELETE
-- UPDATE DATA
-- UPDATE emp set column='new value';

select * from emp;
UPDATE emp set loc ='chennai';
UPDATE emp set loc ='chennai'where empid=1001;
UPDATE emp set loc ='pune' where empid=1002;
UPDATE emp set loc ='mumbai' where fname ='koushil'

-- ALTER TABLE
-- 1. add column
ALTER TABLE emp ADD COLUMN contact int;	
desc emp;

-- modify column
ALTER TABLE emp MODIFY COLUMN contact varchar(10);

-- rename a column
ALTER TABLE emp RENAME COLUMN contact to contact_info;

-- delete a column
ALTER TABLE emp DROP COLUMN contact_info;

-- delete data
TRUNCATE TABLE emp; -- delete entire data from a table
DELETE FROM emp ; -- deletes entire data
DELETE FROM emp where empid=1002;
select * from emp;

-- DROP  : used to drop a table structure from db
DROP TABLE emp;

-- import a csv file into a db table
SELECT * FROM emp_data;

-- clauses in sql
-- where : used to fetch records satisfying a filter condition

-- order by clause 
-- used to sort the data
-- default sort order is ascending
select * from emp;
select * from emp_data;
select * from emp_data order by loc;
select * from emp_data order by loc desc;
select * from emp_data order by loc desc,salary desc;

-- desc table_name : describe table
-- order by desc   : sort data in descending order

-- DISTINCT : 
-- used to fetch the unique values of a column
select DISTINCT loc from emp_data;

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

































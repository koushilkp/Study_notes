-- structured,unstructured,semi structured 
-- database: 
-- collection of related data
-- to store large amount of data
-- easily accessible
-- data consistency/integrity
-- define relations 

-- RDBMS: relational database management system
-- oracle
-- postgresql
-- db2
-- sql server

-- mysql: an RDBMS 
-- database       : to store data
-- user interface : workbench
-- connection

-- SQL : structured query language 
-- store data in the form of tables/relations : rows and columns
-- any sql statement is called as query, every query should end with semicolan (;).
-- domain specific language : only designed to interact with relational databases
-- it is a non case sensitive, SQL keywords are written in upper case.
-- non procedural language : what do we need, not how to get it
-- sequal : simple english query language 
-- we need to follow some syntax while writing queries 

/*
emp : table name
empid,fname,salary,loc,dept_id. CONTACT          : columns/fields/attributes/features
1001. Rahul 50000. pune 10.     9765453678       : rows/records

project:
proj_id,proj_name,no_of_emp,dept_id
101.     GNW.      15.       10
*/

-- databases: database : tables,views,stored procedures,functions(db objects): rows and columns
-- types of commands 
-- DDL (Data Definition Language)    : CREATE , ALTER,TRUNCATE, DROP : auto committed
-- DML (Data Manipulation Language)  : INSERT , UPDATE, DELETE : auto committed
-- DCL (Data Control Language)       : GRANT  ,  REVOKE : DBA(database administrators)
-- TCL (Transaction Control Language): COMMIT ( save), ROLLBACK(undo), SAVEPOINT  
-- DQL (Data Query Language)		 : SELECT (reading the data)

/*
customer:
cust_id,cust_name,ac_no,ac_balance
1001      swapnil. 1234.  30000
transaction:
tran_id,amount,tran_type,remaining_bal
10       10000.  debited    30000

begin transaction
insert
insert
commit;
insert
savepoint a
insert
rollback;
rollback to savepoint a;
end transaction;

ETL : 1000 : 900:
savepoint at each 200 records : rollback till 800 records 
*/

-- databases: database : tables,views,stored procedures,functions(db objects): rows and columns
SHOW DATABASES;

-- CREATE DATABASE DB_NAME; -- created by DBA
create database db_test;

-- USE db_name
USE db_test;

-- CREATE TABLE 
-- CREATE TABLE TABLE_NAME(col1 dtype,col2 dtype,......,coln dtype);
create table emp (empid int , fname varchar(10),salary int, loc varchar(10)); -- table definition/tbl ddl

-- describe table
desc emp;

/*
emp : table name
empid,fname,salary,loc
1001. Rahul 50000. pune 
*/

-- single line comment
/*
multiline 
comment
*/







use db_test;
-- constraints : rules /restrictions on the data
-- not null: restricts null value in a column
-- unique  : duplictae values are not allowed, but null are allowed
-- primary key : combination of not null and unique 
-- foreign key : primary key of another table is foreign key
-- default: sets a default value
-- check:
-- auto increment:alter


-- FOREIGN KEY : 
/*
student      						course 
roll_no,stud_name,address			course_id,course_name,roll_no
101      Rahul    pune				10, testing ,101
roll_no : primary key 				roll_no (foreign key)
parent table 						child table
referenced table					referencing table
*/

select * from student;
select * from course; 

insert into student values(101,'rahul','pune');
insert into course values(10,'testing',101);

-- you cant insert a new value in child table
insert into course values (10,'testing',102);

-- delete a row from parent table
delete from student where roll_no=101;

delete from course where roll_no=101;
delete from student where roll_no=101;

-- DEFAULT :
create table emp_dflt (empid int, project varchar(10) DEFAULT 'bench');
insert into emp_dflt values(1001,'GNW');
select * from emp_dflt;
insert into emp_dflt (empid) values(1003);

-- CHECK : 
create table emp_chk (empid int, empage int ,
CONSTRAINT my_chk CHECK(empage>20));

insert into emp_chk values(1001,25);
select * from emp_chk;
insert into emp_chk values(1001,19);

-- auto increment 
create table emp_inc (empid int auto_increment,fname varchar(10),primary key (empid));
insert into emp_inc (fname) values ('rahul');
select * from emp_inc;
insert into emp_inc (fname) values ('rohit');

-- joins in SQL :
-- used to combine the data from multiple tables
-- col1 and col2 >> col1,col2

-- inner join : common records , intersection 
-- left join  : all values from left table and only matching from right table, null for no match
-- right join : all values from right table and only matching from left table, null for no match
-- self join  : table with itself

-- a left join b : a is the left table and b is the right table

create table tbl1 as select * from db_dev.tbl1;
create table tbl2 as select * from db_dev.tbl2;

select * from tbl1;
select * from tbl2;

/*
tbl1 				tbl2
i					j
col1				col2
------------------------
a					a    inner join :aa,aa,aa,aa,bb,dd
a					a.   left join  :aa,aa,aa,aa,bb,c NULL,null NULL,dd
b					f.   right join : aa,aa,aa,aa,f NULL,dd,bb
c					d	
null				b
d					
*/

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

-- union and union all
-- used to append data
-- col1, col2 >> col1 col2 : join
/*
col1
a
a
b
c
d
col2
a
b
c
d
f
*/
/*
a
a
b
c
d
a 
b
c
d
f
*/

select col1 from tbl1
union all
select col2 from tbl2;
-- 10 rows + 5 rows >> 15 rows in final output 

select col1 from tbl1
union 
select col2 from tbl2;
-- 10 rows + 5 rows ( 3 are matching) >> 10 + 5-3: 12 rows in the final output

select * from tbl1 right join tbl2 ON tbl1.col1=tbl2.col2
union all
select * from tbl1 left join tbl2 ON tbl1.col1=tbl2.col2;

select * from tbl1 right join tbl2 ON tbl1.col1=tbl2.col2
union 
select * from tbl1 left join tbl2 ON tbl1.col1=tbl2.col2;


























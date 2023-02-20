-- 데이터베이스(계정) school
-- system계정 작업
create user school identified by 12345;
grant connect, resource to school;
grant create table, create view, create SEQUENCE to school;
grant insert, select, update, delete on student to school;
grant insert, select, update, delete on professor to school;
grant insert, select, update, delete on class to school;
ALTER USER soldesk DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
-- 삭제
drop user school;
-- ===========================================================================
-- DDL(school 계정 작업)
-- 학사관리 프로젝트(정수 : number, 문자 : varchar2)
-- student(stdnum(p), stdname, gender, address, phone)
-- professor(proid(p), stdid, proname, progender, proaddress, phone)
-- class(classnum(p), stdnum, pronum, classname,  classaddress, classtime)

drop table student;
create table student(
stdnum number(10) not null primary key,
stdname varchar2(20),
gender varchar2(10),
address varchar2(40),
phone varchar2(20)
);
select * from student;
---------------------------------------------------------
drop table class;
create table class(
classnum number(20),
stdnum number(20),
pronum number(20),
classname varchar(20),
classadress varchar(20),
classtime varchar2(20),
primary key(classnum),
foreign key(stdnum) references student(stdnum),
foreign key(pronum) references professor(proid)
);
select * from class;

drop table professor;
create table professor(
proid number (10) not null,
stuid number (10),
proname varchar2 (20),
progender varchar2 (10),
proaddress varchar2 (40),
phone varchar2 (10),
primary key(proid)
);
select * from professor;




















-- DDL(DATA Definition Language) : 데이터 정의
-- SOLDESK
/*
create : 생성
drop : 삭제
alter : 테이블 또는 권한 수정
*/


-- 테이블 생성
drop table department;
create table department(
deptno number not null, --not null : 기본키는 반드시 자료가 있어야함 -> 공백허용 안함
deptname VARCHAR2(40),
manager varchar2(40),
PRIMARY key(deptno) -- 기본키 : 다른 테이블과 조인시 필요
);
-- 전체 검색
select * from department;

-- 테이블명 Employee(기본키 : empno )
-- (empno(정수), name(문자열), phoneno(정수), address(문자열), gender(문자열), position(문자열), deptno(정수))
drop table Employee;
CREATE table Employee(
empno number  not null PRIMARY key,
name VARCHAR2(40),
phonno number,
address VARCHAR2(40) ,
gender VARCHAR2(40),
position VARCHAR2(40),
deptno number,
foreign key(deptno) REFERENCES department(deptno)
);

select * from employee;

-- 테이블명 Project(기본키 : projno)
--(projno(정수), projname(문자열), deptno(정수))
drop table project;
create table project
(projno number not null,
projname varchar2(40),
deptno number,
primary key(projno),
FOREIGN KEY(deptno) REFERENCES department(deptno)
);
select * from project;

-- 테이블명 works(기본키 : projno, empno)
--(projno(정수), empno(정수), hoursworked(정수))
drop table works;
create table works(
projno number not null,
empno number not null,
hoursworked number,
PRIMARY KEY(empno),
foreign key(projno) references Project(projno)
);

select * from works;

-- 입력
-- Department 
insert into Department values(1,'IT', '고남순');
insert into Department values(2,'Marketing', '홍길동');

-- Employee
insert into Employee values(1,'김덕성', 010123456789, '서울', '여', 'Programmer', 1);
insert into Employee values(2,'이서울', 010123456781, '서울', '남', 'Programmer', 1);
insert into Employee values(3,'박연세', 010123456782, '대전', '여', 'Programmer', 2);
insert into Employee values(4,'김경기', 010123456783, '서울', '남', 'Programmer', 2);
insert into Employee values(5,'고인천', 010123456784, '서울', '여', 'Programmer', 1);
-- Project
insert into Project values(1,'DB구축',1);
insert into Project values(2,'화면구현',2);
insert into Project values(3,'배포',1);
insert into Project values(4,'기능구현',2);
insert into Project values(5,'기능구현',2);

-- Works
insert into Works values(1, 1, 3);
insert into Works values(3, 2, 1);
insert into Works values(2, 3, 1);
insert into Works values(2, 4, 5);
insert into Works values(5, 5, 1);



select * from works;
select * from employee ;
select * from department ;
select * from project;




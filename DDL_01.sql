-- DDL(DATA Definition Language) : ������ ����
-- SOLDESK
/*
create : ����
drop : ����
alter : ���̺� �Ǵ� ���� ����
*/


-- ���̺� ����
drop table department;
create table department(
deptno number not null, --not null : �⺻Ű�� �ݵ�� �ڷᰡ �־���� -> ������� ����
deptname VARCHAR2(40),
manager varchar2(40),
PRIMARY key(deptno) -- �⺻Ű : �ٸ� ���̺�� ���ν� �ʿ�
);
-- ��ü �˻�
select * from department;

-- ���̺�� Employee(�⺻Ű : empno )
-- (empno(����), name(���ڿ�), phoneno(����), address(���ڿ�), gender(���ڿ�), position(���ڿ�), deptno(����))
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

-- ���̺�� Project(�⺻Ű : projno)
--(projno(����), projname(���ڿ�), deptno(����))
drop table project;
create table project
(projno number not null,
projname varchar2(40),
deptno number,
primary key(projno),
FOREIGN KEY(deptno) REFERENCES department(deptno)
);
select * from project;

-- ���̺�� works(�⺻Ű : projno, empno)
--(projno(����), empno(����), hoursworked(����))
drop table works;
create table works(
projno number not null,
empno number not null,
hoursworked number,
PRIMARY KEY(empno),
foreign key(projno) references Project(projno)
);

select * from works;

-- �Է�
-- Department 
insert into Department values(1,'IT', '����');
insert into Department values(2,'Marketing', 'ȫ�浿');

-- Employee
insert into Employee values(1,'�����', 010123456789, '����', '��', 'Programmer', 1);
insert into Employee values(2,'�̼���', 010123456781, '����', '��', 'Programmer', 1);
insert into Employee values(3,'�ڿ���', 010123456782, '����', '��', 'Programmer', 2);
insert into Employee values(4,'����', 010123456783, '����', '��', 'Programmer', 2);
insert into Employee values(5,'����õ', 010123456784, '����', '��', 'Programmer', 1);
-- Project
insert into Project values(1,'DB����',1);
insert into Project values(2,'ȭ�鱸��',2);
insert into Project values(3,'����',1);
insert into Project values(4,'��ɱ���',2);
insert into Project values(5,'��ɱ���',2);

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




create table userinfo
(id int primary key not null,
name varchar(20),
loginid varchar(20),
email varchar(20)
);

create table department
(id int primary key not null,
depart_nm varchar(20),
depart_tel varchar(20)
);

insert into userinfo values(1,'�迵��','kyl','kmy@naver.com');
insert into userinfo values(2,'����','khs','khs@naver.com');
insert into userinfo values(3,'�ڼ�','ps','ps@naver.com');
insert into userinfo values(4,'�ְ�','chg','chg@naver.com');
insert into userinfo values(5,'�̹̿�','lmy','lmy@naver.com');

insert into department values(1,'��ȹ��','02-111-2222');
insert into department values(2,'������','02-111-2222');
insert into department values(3,'������',null);
insert into department values(4,null,null);

-- INNER JOIN(=NATUAL Join)
-- ���1(ANSI)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo
inner join department on userinfo.id = department.id;

-- ���2(����Ŭ����)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo, department 
where userinfo.id = department.id;

-- ���3(ANSI)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo, department
where userinfo.id(+)= department.id;

-- OUTER Join
-- LEFT OUTER JOIN : �������̺��� ������ ��µǸ� ������ ���̺����� ���ǿ� �´� ���� ������ �����
-- ���1(ANSI)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo
left outer join department on userinfo.id = department.id;

-- ���2(����Ŭ����)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo, department 
where userinfo.id = department.id(+);

-- OUTER Join
-- right OUTER JOIN : �������̺��� ������ ��µǸ� ������ ���̺����� ���ǿ� �´� ���� ������ �����
-- ���1(ANSI)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo
right outer join department on userinfo.id = department.id;




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

insert into userinfo values(1,'김영롱','kyl','kmy@naver.com');
insert into userinfo values(2,'김희선','khs','khs@naver.com');
insert into userinfo values(3,'박수','ps','ps@naver.com');
insert into userinfo values(4,'최고','chg','chg@naver.com');
insert into userinfo values(5,'이미영','lmy','lmy@naver.com');

insert into department values(1,'기획과','02-111-2222');
insert into department values(2,'영업과','02-111-2222');
insert into department values(3,'관리과',null);
insert into department values(4,null,null);

-- INNER JOIN(=NATUAL Join)
-- 방법1(ANSI)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo
inner join department on userinfo.id = department.id;

-- 방법2(오라클전용)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo, department 
where userinfo.id = department.id;

-- 방법3(ANSI)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo, department
where userinfo.id(+)= department.id;

-- OUTER Join
-- LEFT OUTER JOIN : 왼쪽테이블은 무조건 출력되며 오른쪽 테이블에서도 조건에 맞는 것이 있으면 출력함
-- 방법1(ANSI)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo
left outer join department on userinfo.id = department.id;

-- 방법2(오라클전용)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo, department 
where userinfo.id = department.id(+);

-- OUTER Join
-- right OUTER JOIN : 왼쪽테이블은 무조건 출력되며 오른쪽 테이블에서도 조건에 맞는 것이 있으면 출력함
-- 방법1(ANSI)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo
right outer join department on userinfo.id = department.id;




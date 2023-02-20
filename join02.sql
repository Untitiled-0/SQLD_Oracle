create table part
( id number PRIMARY key not null,
depart_nm VARCHAR2(20),
depart_tel VARCHAR2(20),
foreign key(id) references userinfo(id)
);

-- alter
alter table part add primary key(id);
alter table part add CONSTRAINT part_FK FOREIGN KEY(id) REferences userinfo(id);

insert into part VALUES(1, '��ȹ��', '02-1234-5678');
insert into part VALUES(2, '������', '02-9876-5432');
insert into part VALUES(3, '������', null);
insert into part VALUES(4, null, null);

-- ������ (INNER JOIN=NATUAL JOIN)
-- ���1(ANSI)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo
inner join part on userinfo.id = part.id;
-- ���2(ORACLE ����)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo, part
where userinfo.id = part.id;

-- ���3(ORACLE ����)
select userinfo.id, name, email, depart_nm, depart_tel
from userinfo, part
where userinfo.id (+)= part.id;

-- ������(OUTER JOIN)
-- LEFT OUTER JOIN
-- ���1(ANSI)
select userinfo.id, name, email, depart_nm, depart_tel
from userinfo
left outer join part on userinfo.id = part.id;

CREATE TABLE part (
    id         NUMBER PRIMARY KEY NOT NULL,
    depart_nm  VARCHAR2(20),
    depart_tel VARCHAR2(20),
    FOREIGN KEY ( id )
        REFERENCES userinfo ( id )
);

-- alter

alter table part add primary key (id);
alter table part add CONSTRAINT part_FK FOREIGN key(id)  REFERENCES userinfo(id);


insert into part VALUES(1, '��ȹ��', '02-1234-5678');
insert into part VALUES(2, '������', '02-9876-5432');
insert into part VALUES(3, '������', null);
insert into part VALUES(4, null, null);


select * from department;
select * from part;

-- ������ (INNER JOIN = NATUAL JOIN)
-- ��� 1 ANSI

select userinfo.id,userinfo.name, depart_nm, depart_tel
from userinfo
inner join part on userinfo.id = part.id;

-- ��� 2
SELECT userinfo.id, userinfo.name, email, depart_nm, depart_tel
    FROM userinfo
    WHERE userinfo.id(+) = part.id;

--���3
SELECT userinfo.id, userinfo.name, email, depart_nm, depart_tel
    FROM userinfo
    WHERE userinfo.id = part.id;


-- ������ (OUTER JOIN)
-- LEFT OUTER JOIN
-- ���1(ANSI)
select userinfo.id, name, email, depart_nm, depart_tel
from userinfo
left outer join part on userinfo.id = part.id;

-- ���2(ORACLE ����)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo, part
where userinfo.id = part.id(+);

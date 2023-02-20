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


insert into part VALUES(1, '기획과', '02-1234-5678');
insert into part VALUES(2, '영업과', '02-9876-5432');
insert into part VALUES(3, '관리과', null);
insert into part VALUES(4, null, null);


select * from department;
select * from part;

-- 교집합 (INNER JOIN = NATUAL JOIN)
-- 방법 1 ANSI

select userinfo.id,userinfo.name, depart_nm, depart_tel
from userinfo
inner join part on userinfo.id = part.id;

-- 방법 2
SELECT userinfo.id, userinfo.name, email, depart_nm, depart_tel
    FROM userinfo
    WHERE userinfo.id(+) = part.id;

--방법3
SELECT userinfo.id, userinfo.name, email, depart_nm, depart_tel
    FROM userinfo
    WHERE userinfo.id = part.id;


-- 합집합 (OUTER JOIN)
-- LEFT OUTER JOIN
-- 방법1(ANSI)
select userinfo.id, name, email, depart_nm, depart_tel
from userinfo
left outer join part on userinfo.id = part.id;

-- 방법2(ORACLE 전용)
select userinfo.id, userinfo.name, email, depart_nm, depart_tel
from userinfo, part
where userinfo.id = part.id(+);

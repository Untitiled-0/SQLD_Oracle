-- 이상현상을 제거하기 위한 정규화 
-- 학생관리와 강좌관리로 분리

-- 학생관리
drop table summerEnroll;
create table summerEnroll(
sid number,
class varchar2(20)
);

-- 강좌관리
drop table summerPrice;
create table summerPrice(
class varchar2(20),
price number
);

insert into summerEnroll values(300,'Spring');
insert into summerEnroll values(400,'Python');
insert into summerEnroll values(400,'Python');
insert into summerEnroll values(500,'JAVA2');
insert into summerEnroll values(600,'JAVA2');

insert into SummerPrice values('JAVA',20000);
insert into SummerPrice values('ORACLE',23000);
insert into SummerPrice values('Spring',40000);
insert into SummerPrice values('Python',20000);
insert into SummerPrice values('JAVA2',20000);
insert into SummerPrice(class, price) values('BIGDATA',35000);

select * from summerenroll;
select * from summerPrice;

-- delete anomary

-- insert anomary

-- update anomary


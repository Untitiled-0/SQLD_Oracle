-- 정규화 과정
-- 잘못된 테이블 설계로 인한 anomaly(이상)을 최소화하는 과정
-- 삭제이상 (delete anomary)
-- 삽입이상 (insertion anomary)
-- 수정이상 (update anomary)


create table summer(
    sid number,
    class varchar2(40),
    price number
);

insert into summer values(100,'JAVA',20000);
insert into summer values(200,'ORACLE',23000);
insert into summer values(300,'SPRING',40000);
insert into summer values(400,'PYTHON',20000);
insert into summer values(500,'JAVA2',20000);
insert into summer(class, price) values('BIGDATA',35000);
insert into summer values(600,'JAVA2',20000);

select * from summer order by sid;


select price 수강료 from summer where class like 'SPRING';
delete from summer where sid = 300;


select count(*) 수강생수 from summer where sid is not null;


update summer
set price = 18000 
where class like 'JAVA2';


update summer
set price = 20000 
where class like 'JAVA2' and sid = 600;


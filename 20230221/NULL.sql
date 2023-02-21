-- NULL
create table mybook (
bookid number,
price number
);

insert into mybook values(1,10000);
insert into mybook values(2,20000);
insert into mybook values(3,null);
insert into mybook values(3,25000);
insert into mybook values(3,15000);

select * from mybook;

select sum(price) 합계, avg(price) 평균 , count(*) 갯수
from mybook
where price is not null;


-- 전처리 : 불필요한 자료를 null값 처리한다.
-- NULL 찾기 NULL 제외

-- null 찾기

select * from mybook
where price is null;

-- null 제외

select * from mybook
where price is not null; 



---------------------------------------------------

select * from customer;

select name 성명, nvl(phone,'번호정보없음') 전화번호
from customer;


-- 가상컬럼 활용
select ROWNUM 순번, custid, name, phone
from customer
where ROWNUM <= 5;



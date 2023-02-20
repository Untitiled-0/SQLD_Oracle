-- SYSTEM계정에서 작업
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- 계정생성(Sales,12345) 권한부여(접속)부여
create user sales IDENTIFIED by 12345;
-- 등록
grant connect, resource to sales;


-- 권한부여(기본 DDL)
grant create table, create view, create SEQUENCE to sales;
-- 권한부여(DML)
grant insert, select, update, delete on sales to sales;
grant insert, select, update, delete on promotions to sales;
grant insert, select, update, delete on customer to sales;
-- 물리적 저장 공간
ALTER USER sales DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
-------------------------------------------------------
-- sales계정에서 작업
-- 테이블 생성(sales(slaesdate, book_id, custmer_id, quantity, amount), promotions(custmer_id, campaign, promodate))
-- alter 기본키 설정(promotions =>custmer_id )
-- foreign key(부모테이블 customer=>자식테이블 sales)
-- foreign key(부모테이블 customer=>자식테이블 promotions)
-- 부모
CREATE TABLE  Customer (
  custid      NUMBER(2) PRIMARY KEY,  
  name        VARCHAR2(40),
  address     VARCHAR2(50),
  phone       VARCHAR2(20)
);

-- 자식
create table sales(
salesdate date,
book_id number,
custmer_id number,
quantity  NUMBER,
amount number);

alter table sales add primary key(custmer_id);
alter table sales add CONSTRAINT cust_sales_foreign foreign key(custmer_id) references customer(custid);
alter table sales drop CONSTRAINT cust_sales_foreign
--자식
drop table promotions;
create table promotions(
campaign VARCHAR2(40),
promodate date,
custmer_id number 
);

alter table promotions add CONSTRAINT cust_pro_foreign foreign key(custmer_id) references customer(custid);
alter table promotions drop CONSTRAINT cust_pro_foreign


-- 데이터 입력
INSERT INTO Customer VALUES(1, '박지성','영국 맨체스타','010-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);

select * from customer;

-----------------------------------------------------------------------------
insert into sales values(to_Date('2023-02-16', 'yyyy-mm-dd'), 2,3,1,15);
insert into sales values(to_Date('2023-02-16', 'yyyy-mm-dd'), 1,2,1,12);
insert into sales values(to_Date('2023-02-16', 'yyyy-mm-dd'), 3,5,1,13);
select * from sales;
-----------------------------------------------------------------------------
delete from promotions;
insert into promotions values( '바보',to_Date('2023-02-17','yyyy-mm--dd'),3);
insert into promotions values( '멍청이',to_Date('2023-02-18','yyyy-mm--dd'),5);
insert into promotions values( '초코',to_Date('2023-03-19','yyyy-mm--dd'),2);
select * from promotions;
-------------------------------------------------------------------------------
-- 구매고객과 구매하지 않은 고객 모두 보이시오

select custid, name, sales.salesdate, sales.quantity
from customer
left outer join sales on customer.custid=sales.custmer_id
order by salesdate;

select custid, name, sales.salesdate, sales.quantity, sales.amount, promotions.campaign
from customer
left  join sales on customer.custid=sales.custmer_id
left outer join promotions on customer.custid=promotions.custmer_id
order by salesdate;

select name
from customer 
left outer join sales on customer.custid = sales.custmer_id;

-- 구매한 고객만 출력
select name, sales.salesdate, sales.quantity
from customer 
inner join sales on customer.custid = sales.custmer_id;







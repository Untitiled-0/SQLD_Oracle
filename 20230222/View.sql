-- View

/*

-  뷰의 장점
    편리성 : 미리 정의된 테이블
    재사용성 : 자주 사용되는 질의를 뷰로 정의해 놓고 사용 
    보안성 : 각 사용자별로 특정 데이터만 선별하여 보여줌
   중요한  질의의 경우 암호화하여 사용가능
   
- 뷰의 단점
    데이터 조작 (INSERT, UPDATE, DELETE)에 제한
    Alter문 사용 불가능
    
    

*/

select * from customer;


-- view 생성
create view vm_customer(custid, name, address)
as
select custid, name, address
from customer
where address like '%영국%';


-- view 수정
create or replace view vm_customer(name, address)
as
select name, address
from customer
where address like '%영국%';

select * from vm_customer;

drop view vm_customer;

-----------------------------------------------

select * from customer;
select * from orders;

-- 판매가격이 15000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판
-- (highorder view)

select * from vw_orders;

create or replace view vw_orders (bookid, bookname, name, publisher, saleprice)
as select od.bookid, bk.bookname, cs.name, bk.publisher, od.saleprice
    from orders od
    inner join customer cs on od.custid = cs.custid
    inner join book bk on od.bookid = bk.bookid
    where od.saleprice >= 20000;

-- vw_book, vw_customer

-- vw_book
create view vw_book (bookname)
as
select bookname
from book
where bookname like '%축구%';

select * from vw_book;

-- vw_customer
create view vw_customer (name, address)
as
select name, address
from customer
where address like '%대한민국%';

select * from vw_customer;



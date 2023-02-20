-- INNER JOIN
-- customer테이블과 orders테이블 연결하여 출력
select *
from customer, orders;

-- 고객과 고객의 주문에 대한 데이터를 보이시오
-- oracle 
select *
from customer, orders
where customer.custid=orders.custid
order by customer.custid; 
-- sql
select * from 
customer 
inner join orders on customer.custid=orders.custid 
order by customer.custid;

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 보이시오
select name, saleprice
from customer
inner join orders on customer.custid=orders.custid
order by name;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고 고객별로 정렬하시오
--oracle
select name, sum(saleprice)
from customer, orders 
where customer.custid=orders.custid
GROUP BY customer.name
order by name;

-- sql
select name, sum(saleprice)
from customer
inner join orders on customer.custid=orders.custid
GROUP BY customer.name
order by name;

-- 고객의 이름과 고객이 주문한 도서의 이름을 보이시오
select name, bookname
from customer cs, orders od, book bk
where cs.custid=od.custid and od.bookid=bk.bookid;

select name, bookname
from orders od
INNER JOIN customer cs on od.custid=cs.custid
INNER JOIN book bk on od.bookid=bk.bookid
where  bk.price>=20000;

-- 고객의 이름과 고객이 주문한 도서의 이름을 보이시오 (단 20000원 이상 구매한 고객)
select name, bookname
from customer cs, orders od, book bk
where cs.custid=od.custid and od.bookid=bk.bookid
    and bk.price>=20000;
    
-- OUTER JOIN
-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 보이시오
select name, saleprice
from customer
left outer join orders on customer.custid=orders.custid
order by name;

-- 오라클
select name, saleprice
from customer cs, orders od 
where cs.custid=od.custid(+) 
order by name;

--  구매되지 않은 도서을 포함하여 도서의 이름과 고객이 주문한 도서의 판매가격을 보이시오
SELECT bookname, saleprice
FROM book 
LEFT OUTER JOIN orders
ON book.bookid = orders.bookid
ORDER BY bookname;
-- 오라클
select bookname, saleprice
from book, orders
where  book.bookid=orders.bookid(+)
order by bookname;
/*
구매되지 않은 도서을 포함하여 도서의 이름과 고객이 주문한 도서의 판매가격을 보이되
도서이름별 총 판매액을 보이시오
*/
select bookname, sum(saleprice) 
from book, orders 
where book.bookid=orders.bookid(+) 
group by bookname 
order by 2;

select bookname, sum(saleprice) 
from book bk 
left outer join orders od on bk.bookid=od.bookid 
group by bookname 
order by 2;

SELECT 
    BOOK.BOOKNAME as "도서 이름", 
    SUM(ORDERS.SALEPRICE) as "총 판매액"
FROM
    BOOK
    LEFT OUTER JOIN ORDERS ON BOOK.BOOKID = ORDERS.BOOKID
GROUP BY BOOK.BOOKNAME
ORDER BY 2;

-----------------------------------------------------
select distinct bookname, saleprice
from book
left outer join orders on book.bookid = orders.bookid
order by 2;
-- right조인은(자식테이블 기준) inner join과 동일한 결과가 나오므로 사용빈도가 낮다
select distinct bookname, saleprice
from book
RIGHT outer join orders on book.bookid = orders.bookid
order by saleprice;





















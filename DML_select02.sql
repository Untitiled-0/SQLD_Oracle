-- INNER JOIN
-- customer���̺�� orders���̺� �����Ͽ� ���
select *
from customer, orders;

-- ���� ���� �ֹ��� ���� �����͸� ���̽ÿ�
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

-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���̽ÿ�
select name, saleprice
from customer
inner join orders on customer.custid=orders.custid
order by name;

-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ� ������ �����Ͻÿ�
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

-- ���� �̸��� ���� �ֹ��� ������ �̸��� ���̽ÿ�
select name, bookname
from customer cs, orders od, book bk
where cs.custid=od.custid and od.bookid=bk.bookid;

select name, bookname
from orders od
INNER JOIN customer cs on od.custid=cs.custid
INNER JOIN book bk on od.bookid=bk.bookid
where  bk.price>=20000;

-- ���� �̸��� ���� �ֹ��� ������ �̸��� ���̽ÿ� (�� 20000�� �̻� ������ ��)
select name, bookname
from customer cs, orders od, book bk
where cs.custid=od.custid and od.bookid=bk.bookid
    and bk.price>=20000;
    
-- OUTER JOIN
-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���̽ÿ�
select name, saleprice
from customer
left outer join orders on customer.custid=orders.custid
order by name;

-- ����Ŭ
select name, saleprice
from customer cs, orders od 
where cs.custid=od.custid(+) 
order by name;

--  ���ŵ��� ���� ������ �����Ͽ� ������ �̸��� ���� �ֹ��� ������ �ǸŰ����� ���̽ÿ�
SELECT bookname, saleprice
FROM book 
LEFT OUTER JOIN orders
ON book.bookid = orders.bookid
ORDER BY bookname;
-- ����Ŭ
select bookname, saleprice
from book, orders
where  book.bookid=orders.bookid(+)
order by bookname;
/*
���ŵ��� ���� ������ �����Ͽ� ������ �̸��� ���� �ֹ��� ������ �ǸŰ����� ���̵�
�����̸��� �� �Ǹž��� ���̽ÿ�
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
    BOOK.BOOKNAME as "���� �̸�", 
    SUM(ORDERS.SALEPRICE) as "�� �Ǹž�"
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
-- right������(�ڽ����̺� ����) inner join�� ������ ����� �����Ƿ� ���󵵰� ����
select distinct bookname, saleprice
from book
RIGHT outer join orders on book.bookid = orders.bookid
order by saleprice;





















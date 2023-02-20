-- SELECT FROM WHERE
-- ��� ������ �̸��� ������ ���̽ÿ�
SELECT * FROM BOOK;
SELECT BOOKNAME, PRICE
FROM BOOK;

SELECT  PRICE, BOOKNAME
FROM BOOK;
-- ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�
SELECT  PUBLISHER
FROM BOOK;
-- �ߺ��Ǵ� ������ ���� Ű����(DISTINCT)
SELECT  DISTINCT PUBLISHER
FROM BOOK;

-- WHERE
SELECT * FROM BOOK
WHERE PRICE <= 8000;

-- ������ 10,000�̻� 20,000������ ������ �˻��Ͻÿ�
SELECT * FROM BOOK
WHERE PRICE BETWEEN 10000 AND 20000;

SELECT * FROM BOOK
WHERE PRICE >= 10000 AND PRICE <= 20000;

-- ����
SELECT * FROM BOOK
WHERE publisher in('�½�����', '���ѹ̵��');

SELECT * FROM BOOK
WHERE publisher NOT in('�½�����', '���ѹ̵��');

-- ����
SELECT bookname, publisher
from book
where bookname like '�౸�� ����';

SELECT bookname, publisher
from book
where bookname like '%�౸%';

SELECT *
from book
where bookname like '_��%';

-- ��������
-- �౸�� ���� ���� �� ������ 20000�� �̻��� ������ ���� ���
select *
from book
where bookname like '%�౸%' and price >= 20000;
-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�
select *
from book
where publisher like '�½�����' or publisher like '���ѹ̵��';

-- ������ �̸������� �˻��Ͻÿ�
select * 
from book
ORDER BY bookname ASC;

-- ������ ���ݼ����� �����ϰ�, ������ ������ �̸������� �˻��Ͻÿ�
select * 
from book
ORDER BY price, bookname;

-- ������ ������ ������������ �˻��Ͻÿ�, ���࿡ ������ ������ ���ǻ��� ������������ �˻�
select * 
from book
ORDER BY price DESC, bookname ASC;

-- ���� �Լ�
select * from orders;
select sum(saleprice) as �Ѹ���
from orders;

-- 2�� ���� �ֹ��� ������ �� �Ǹž��� ���̽ÿ�
select sum(saleprice) as "�� �Ǹž�"
from orders
where custid=2;

-- ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ��� ���̽ÿ�
select sum(saleprice) as "�� �Ǹž�",
       avg(saleprice) as ��հ�,
       min(saleprice) as ������,
       max(saleprice) as �ְ�
from orders;

-- ���缭���� ���� �Ǹ� �Ǽ��� ���Ͻÿ�
select count(*)
from orders;

-- ���缭���� ���� �ǸŰ����� 20000�� �̻��� �Ǽ��� ���Ͻÿ�
select count((case when saleprice >= 20000 then 1 end)) as VIP
from orders;

-- ���缭���� ���� �ǸŰ����� 20000�� �̻��� �Ǽ��� 10000�� ���� �Ǽ��� ���Ͻÿ�
select count((case when saleprice >= 20000 then 1 end)) as VIP,
       count((case when saleprice <= 10000 then 1 end)) as CS
from orders;

-- Group By 
select custid, saleprice
from orders
order by custid;

-- ������ �ֹ��� ������ �� �Ǹż����� ���̽ÿ�
select custid, count(*) as �Ǹż���
from orders
group by custid;
-- ������ �ֹ��� ������ �� �Ǹž��� �����̵� �������� ������������ ���̽ÿ�
select custid, sum(saleprice) as ���Ǹž�
from orders
group by custid
order by custid;

-- ������ 10000�� �̻��� ������ ������ ���� ���� ���� �ֹ������� �Ѽ����� ���̽ÿ� (�� 3�� �̻� ������ ���� ���)
select custid, count(*) as �Ǹż���
from orders
where saleprice >= 10000
group by custid
HAVING count(*) >= 3;



























-- UPDATE SET WHERE
SELECT * FROM CUSTOMER;

UPDATE customer
SET ADDRESS='���ѹα� �λ�'
WHERE CUSTID=5;

update customer
set address=(SELECT ADDRESS FROM customer WHERE NAME like '�迬��')
where name like '�ڼ���';

-- DELETE FROM WHERE
select * 
from imported_book
order by bookid;

delete from imported_book
where bookid=22;

delete from imported_book; --���̺� �����ְ� ����Ÿ ��� ����

-- madang�������� �۾�
-- orders���̺��� ���� ���� 
-- 5�� 15000 / 7�� 20000 / 10�� 7000
SELECT * from orders;
update orders 
set saleprice=15000
where bookid=5;

update orders 
set saleprice=20000
where bookid=7;

update orders 
set saleprice=7000
where bookid=10;







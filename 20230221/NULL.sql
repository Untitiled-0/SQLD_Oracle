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

select sum(price) �հ�, avg(price) ��� , count(*) ����
from mybook
where price is not null;


-- ��ó�� : ���ʿ��� �ڷḦ null�� ó���Ѵ�.
-- NULL ã�� NULL ����

-- null ã��

select * from mybook
where price is null;

-- null ����

select * from mybook
where price is not null; 



---------------------------------------------------

select * from customer;

select name ����, nvl(phone,'��ȣ��������') ��ȭ��ȣ
from customer;


-- �����÷� Ȱ��
select ROWNUM ����, custid, name, phone
from customer
where ROWNUM <= 5;



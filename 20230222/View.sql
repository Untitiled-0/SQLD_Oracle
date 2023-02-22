-- View

/*

-  ���� ����
    ���� : �̸� ���ǵ� ���̺�
    ���뼺 : ���� ���Ǵ� ���Ǹ� ��� ������ ���� ��� 
    ���ȼ� : �� ����ں��� Ư�� �����͸� �����Ͽ� ������
   �߿���  ������ ��� ��ȣȭ�Ͽ� ��밡��
   
- ���� ����
    ������ ���� (INSERT, UPDATE, DELETE)�� ����
    Alter�� ��� �Ұ���
    
    

*/

select * from customer;


-- view ����
create view vm_customer(custid, name, address)
as
select custid, name, address
from customer
where address like '%����%';


-- view ����
create or replace view vm_customer(name, address)
as
select name, address
from customer
where address like '%����%';

select * from vm_customer;

drop view vm_customer;

-----------------------------------------------

select * from customer;
select * from orders;

-- �ǸŰ����� 15000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ����
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
where bookname like '%�౸%';

select * from vw_book;

-- vw_customer
create view vw_customer (name, address)
as
select name, address
from customer
where address like '%���ѹα�%';

select * from vw_customer;



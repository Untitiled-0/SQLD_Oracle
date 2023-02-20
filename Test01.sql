-- SYSTEM�������� �۾�
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- ��������(Sales,12345) ���Ѻο�(����)�ο�
create user sales IDENTIFIED by 12345;
-- ���
grant connect, resource to sales;


-- ���Ѻο�(�⺻ DDL)
grant create table, create view, create SEQUENCE to sales;
-- ���Ѻο�(DML)
grant insert, select, update, delete on sales to sales;
grant insert, select, update, delete on promotions to sales;
grant insert, select, update, delete on customer to sales;
-- ������ ���� ����
ALTER USER sales DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
-------------------------------------------------------
-- sales�������� �۾�
-- ���̺� ����(sales(slaesdate, book_id, custmer_id, quantity, amount), promotions(custmer_id, campaign, promodate))
-- alter �⺻Ű ����(promotions =>custmer_id )
-- foreign key(�θ����̺� customer=>�ڽ����̺� sales)
-- foreign key(�θ����̺� customer=>�ڽ����̺� promotions)
-- �θ�
CREATE TABLE  Customer (
  custid      NUMBER(2) PRIMARY KEY,  
  name        VARCHAR2(40),
  address     VARCHAR2(50),
  phone       VARCHAR2(20)
);

-- �ڽ�
create table sales(
salesdate date,
book_id number,
custmer_id number,
quantity  NUMBER,
amount number);

alter table sales add primary key(custmer_id);
alter table sales add CONSTRAINT cust_sales_foreign foreign key(custmer_id) references customer(custid);
alter table sales drop CONSTRAINT cust_sales_foreign
--�ڽ�
drop table promotions;
create table promotions(
campaign VARCHAR2(40),
promodate date,
custmer_id number 
);

alter table promotions add CONSTRAINT cust_pro_foreign foreign key(custmer_id) references customer(custid);
alter table promotions drop CONSTRAINT cust_pro_foreign


-- ������ �Է�
INSERT INTO Customer VALUES(1, '������','���� ��ü��Ÿ','010-5000-0001');
INSERT INTO Customer VALUES (2, '�迬��', '���ѹα� ����', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '��̶�', '���ѹα� ������', '000-7000-0001');
INSERT INTO Customer VALUES (4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
INSERT INTO Customer VALUES (5, '�ڼ���', '���ѹα� ����',  NULL);

select * from customer;

-----------------------------------------------------------------------------
insert into sales values(to_Date('2023-02-16', 'yyyy-mm-dd'), 2,3,1,15);
insert into sales values(to_Date('2023-02-16', 'yyyy-mm-dd'), 1,2,1,12);
insert into sales values(to_Date('2023-02-16', 'yyyy-mm-dd'), 3,5,1,13);
select * from sales;
-----------------------------------------------------------------------------
delete from promotions;
insert into promotions values( '�ٺ�',to_Date('2023-02-17','yyyy-mm--dd'),3);
insert into promotions values( '��û��',to_Date('2023-02-18','yyyy-mm--dd'),5);
insert into promotions values( '����',to_Date('2023-03-19','yyyy-mm--dd'),2);
select * from promotions;
-------------------------------------------------------------------------------
-- ���Ű��� �������� ���� �� ��� ���̽ÿ�

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

-- ������ ���� ���
select name, sales.salesdate, sales.quantity
from customer 
inner join sales on customer.custid = sales.custmer_id;







create table customer_2(
name VARCHAR2(20) PRIMARY KEY,
city varchar2(20),
industytype varchar2(20)
);

create table order_2(
orderid number,
custname VARCHAR2(20),
salesperson VARCHAR2(20),
amount number,
PRIMARY KEY(orderid),
foreign key(custname) references customer_2(name) on delete cascade,
foreign key(salesperson) references salesperson(name) on delete cascade
);

create table salesperson(
name VARCHAR2(20) PRIMARY KEY,
age number,
salary number
);
-- alter ��������
create table order_2(
orderid number,
custname VARCHAR2(20),
salesperson VARCHAR2(20),
amount number
);

create table customer_2(
name VARCHAR2(20),
city varchar2(20),
industytype varchar2(20)
);
-- �Ǹ���
create table salesperson(
name VARCHAR2(20),
age number,
salary number
);

-- �⺻Ű orderid, name, name
alter table order_2 add primary key(orderid);
alter table customer_2 add primary key(name);
alter table salesperson add primary key(name);

-- not null : custname, city, salary
alter table order_2 MODIFY custname varchar2(20) not null;
alter table customer_2 MODIFY city varchar2(20) not null;
alter table salesperson MODIFY salary number not null;

-- ��������(�ڽ����̺� order_2 / �θ����̺� : salesperson, customer_2)
alter table order_2 add CONSTRAINT sales_foreign FOREIGN KEY(salesperson) REFERENCES salesperson(name);
alter table order_2 add CONSTRAINT cust_foreign FOREIGN KEY(custname) REFERENCES customer_2(name);

insert into customer_2 values('TOM','colombia','farming');
insert into customer_2 values('David','florida','computer');
insert into customer_2 values('James','goorgia','fishery');
insert into customer_2 values('Eric','Arkansas','computer');
insert into customer_2 values('Adrian','cilorado','farming');
insert into customer_2 values('Sofia','LA','fishery');
insert into customer_2 values('Julia','LA','farming');

insert into salesperson values('kevin',28,3500);
insert into salesperson values('Angel',32,4000);
insert into salesperson values('daniel',34,2700);

insert into order_2 values(1,'Eric','kevin',4);
insert into order_2 values(2,'James','Angel',5);
insert into order_2 values(3,'Sofia','daniel',6);
insert into order_2 values(4,'Eric','Angel',4500);
insert into order_2 values(5,'Adrian','kevin',8000);
insert into order_2 values(6,'James','kevin',4000);
insert into order_2 values(7,'TOM','Angel',20000);
insert into order_2 values(8,'Eric','daniel',6000);
insert into order_2 values(9,'David','Angel',42000);
insert into order_2 values(10,'Eric','daniel',7000);
insert into order_2 values(11,'Adrian','daniel',21000);
insert into order_2 values(12,'Sofia','Angel',25000);
insert into order_2 values(13,'Julia','kevin',10000);

select count(DISTINCT custname) from order_2;


------------------------------------------------------------------------
-- ���ž��̵�� ������ ���� �̸�, ������ ���� ����, �Ǹ����̸�(salesperson)�� �Ǹż���(salary)�� ����Ͻÿ�
select orderid as ���ž��̵�,
       custname as ���̸�, 
       city as ������, 
       salesperson as �Ǹ���, 
       salary as �ǸŰ���
from customer_2, order_2, salesperson
where customer_2.name = order_2.custname 
and order_2.salesperson = salesperson.name;

SELECT
    ORDER_2.ORDERID as ���ž��̵�,
    CUSTOMER_2.NAME as ���̸�,
    CUSTOMER_2.CITY as ������,
    SALESPERSON.NAME as �Ǹ����̸�,
    SALESPERSON.SALARY as �Ǹż���
FROM
    ORDER_2
    INNER JOIN CUSTOMER_2 ON ORDER_2.CUSTNAME = CUSTOMER_2.NAME
    INNER JOIN SALESPERSON ON ORDER_2.SALESPERSON = SALESPERSON.NAME;


















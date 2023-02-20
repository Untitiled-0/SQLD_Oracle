drop table userinfo;
select * from userinfo;

create table userinfo
(id int not null,
name varchar(20),
loginid varchar(20),
email varchar(20)
);

drop table depart;
select * from depart;

create table depart
(id int not null,
depart_nm varchar(20),
depart_tel varchar(20)
);

-- Alter -> �������� 

-- primary key ��������
alter table userinfo ADD PRIMARY KEY(id);
alter table depart ADD PRIMARY KEY(id);
-- foreign key ��������
alter table depart add CONSTRAINT ud_FK FOREIGN key(id) REFERENCES userinfo(id);
-- foreign key �������� ����
alter table depart drop CONSTRAINT ud_FK;
-- not null ��������(depart_tel)
alter table depart MODIFY depart_tel varchar(30) not null;



--------------------------------------------------------------------------
drop table NEWbook;
create table Newbook
( bookid number,
bookname VARCHAR2(40),
publisher VARCHAR2(40),
price number
);
drop table Newcustomer;
create table Newcustomer
( custid number,
name VARCHAR2(40),
address VARCHAR2(40),
phone number
);
drop table Neworders;
create table Neworders
( orderid number,
custid number,
bookid number,
saleprice number,
orderdate DATE
);

select * from newbook;
select * from newcustomer;
select * from neworders;

-- ���� ����(primary key)
alter table newbook add primary key(bookid);
alter table newcustomer add primary key(custid);
alter table neworders add primary key(orderid);
-- bookid�� not null
alter table newbook  MODIFY bookid number NOT NULL;
-- Foreign key (neworders => newcustoter, newbook)
alter table neworders add CONSTRAINT bk_FK 
FOREIGN key(bookid) REFERENCES newbook(bookid);

alter table neworders add CONSTRAINT cs_FK2 
FOREIGN key(custid) REFERENCES newcustomer(custid);
-- ���� �߰� ����
select * from newbook; --����Ÿ ���
desc newbook; -- ���̺��� �������
-- ���̺�� ����
alter table newbook rename to TB_newbook;
alter table TB_newbook rename to newbook;

-- ���̺� �Ӽ� �߰�
alter table newbook add isbn VARCHAR2(20);
-- �Ӽ� Ÿ�Ժ���
alter table newbook MODIFY isbn number;
-- �÷��� ����
alter table newbook rename column isbn to iss;
-- �÷� ����
alter table newbook drop column iss;








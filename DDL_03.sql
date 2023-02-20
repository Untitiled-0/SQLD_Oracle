-- �⺻Ű�� �ΰ��� ��� ��ȣ�� ����Ͽ� ����Ű�� �����Ѵ�
create table NewBook(
bookname VARCHAR2(20),
publisher VARCHAR2(20),
price number,
PRIMARY key(bookname, publisher)
);

-- UNIQUE : �ߺ������� �Է� �Ұ���
-- DEFAULT : �Է°��� ������� �⺻������ ��ü
-- check : �����Է½� �ּ� �ݾ�
/*
create table NewBook(
bookname VARCHAR2(20) not null,
publisher VARCHAR2(20) UNIQUE,
price number DEFAULT 100 check(price > 3000),
PRIMARY key(bookname, publisher)
);*/

create table newcustomer(
custid number PRIMARY key,
name VARCHAR2(40),
address VARCHAR2(40),
phone VARCHAR2(40)
);

-- on delete CASCADE, on upate cascade : �θ����̺��� ���� �Ǵ� ������Ʈ�� �ڵ����� �Ҹ� �Ǵ� ����
-- on upate cascade�� ����Ŭ������ �������� ���� => Ʈ���ſ��� update cascade
create table neworders(
orderid number,
custid number,
saleprice number,
orderdate date,
PRIMARY key(orderid),
FOREIGN key(custid) references newcustomer(custid) on delete CASCADE
);

drop table mother_tbl;
create table mother_tbl(
m_val VARCHAR2(20) PRIMARY key
);

create table chile_tbl(
m_val VARCHAR2(20),
c_val VARCHAR2(20),
FOREIGN KEY(m_val) REFERENCES mother_tbl(m_val) on delete CASCADE 
);

SELECT * from mother_tbl;
insert into mother_tbl values('A');
insert into mother_tbl values('B');
insert into mother_tbl values('C');
insert into mother_tbl values('D');
insert into mother_tbl values('E');

SELECT * from chile_tbl;
insert into chile_tbl values('A', 'A��1');
insert into chile_tbl values('A', 'A��2');
insert into chile_tbl values('B', 'B��1');
insert into chile_tbl values('B', 'B��2');
insert into chile_tbl values('C', 'C��1');

delete from mother_tbl where m_val='A';

create table memberjoin(
id VARCHAR2(20),
pwd VARCHAR2(20)
);

insert into memberjoin values('smile','12345');
insert into memberjoin values('soldesk','12345');













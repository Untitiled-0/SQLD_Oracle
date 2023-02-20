-- 기본키가 두개일 경우 괄호를 사용하여 복합키로 지정한다
create table NewBook(
bookname VARCHAR2(20),
publisher VARCHAR2(20),
price number,
PRIMARY key(bookname, publisher)
);

-- UNIQUE : 중복데이터 입력 불가능
-- DEFAULT : 입력값이 없을경우 기본값으로 대체
-- check : 직접입력시 최소 금액
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

-- on delete CASCADE, on upate cascade : 부모테이블에서 삭제 또는 업데이트시 자동으로 소멸 또는 갱신
-- on upate cascade는 오라클에서는 지원하지 않음 => 트리거에서 update cascade
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
insert into chile_tbl values('A', 'A값1');
insert into chile_tbl values('A', 'A값2');
insert into chile_tbl values('B', 'B값1');
insert into chile_tbl values('B', 'B값2');
insert into chile_tbl values('C', 'C값1');

delete from mother_tbl where m_val='A';

create table memberjoin(
id VARCHAR2(20),
pwd VARCHAR2(20)
);

insert into memberjoin values('smile','12345');
insert into memberjoin values('soldesk','12345');













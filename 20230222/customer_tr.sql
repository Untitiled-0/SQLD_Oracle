-- BOOK TABLE, CUSTOMER, ORDERS, Imported_Book

CREATE TABLE Book (
  bookid      NUMBER(2) PRIMARY KEY,
  bookname    VARCHAR2(40),
  publisher   VARCHAR2(40),
  price       NUMBER(8) 
);

CREATE TABLE  Customer (
  custid      NUMBER(2) PRIMARY KEY,  
  name        VARCHAR2(40),
  address     VARCHAR2(50),
  phone       VARCHAR2(20)
);

CREATE TABLE Orders(
orderid NUMBER(2) primary key,
custid NUMBER(2) REFERENCES Customer(custid),
bookid NUMBER(2) REFERENCES Book(bookid),
saleprice NUMBER(10),
orderdate DATE
);

CREATE TABLE Imported_Book (
  bookid      NUMBER ,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       NUMBER(8) 
);

-- Book 
INSERT INTO Book VALUES(1,'축구의 역사','굿스포츠',8000);
INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);
-- Customer
INSERT INTO Customer VALUES(1, '박지성','영국 맨체스타','010-5000-0001');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전',  NULL);
-- Orders
INSERT INTO orders VALUES(1,  1, 1, 6000, TO_DATE('2014-07-01','YYYY-MM-DD'));
INSERT INTO Orders VALUES (2, 1, 3, 21000, TO_DATE('2014-07-03','yyyy-mm-dd'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, TO_DATE('2014-07-03','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (4, 3, 6, 6000, TO_DATE('2014-07-04','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (5, 4, 7, 20000, TO_DATE('2014-07-05','yyyy-mm-dd'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, TO_DATE('2014-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, TO_DATE( '2014-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, TO_DATE('2014-07-08','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (9, 2, 10, 7000, TO_DATE('2014-07-09','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (10, 3, 8, 13000, TO_DATE('2014-07-10','yyyy-mm-dd'));
INSERT INTO Orders VALUES (11, 1, 5, 15000, TO_DATE('2014-07-09','yyyy-mm-dd')); 
INSERT INTO Orders VALUES (12, 3, 7, 25000, TO_DATE('2014-07-03','yyyy-mm-dd'));

-- Imported_Book
INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

-- DROP TABLE
DROP TABLE BOOK;
DROP TABLE CUSTOMER;
DROP TABLE ORDERS;
DROP TABLE IMPORTED_BOOK;



--tr
select * from customer;
-- crate customer_log
create table customer_log(
custid_l number,
custname_l varchar2(40),
address_l varchar2(40),
phone_l varchar2(40),
cusdate varchar2(40),
worked varchar2(40)
);

select * from customer;
select * from customer_log;

-- alterInsertCustomer
drop trigger afterInsertCustomer;
create or replace trigger afterInsertCustomer
after insert on customer for each row
begin
    insert into customer_log
    values(:new.custid, :new.name, :new.address, :new.phone,to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),'INSERT_TRIGGER' );
    DBMS_OUTPUT.put_line('입력한 자료를 costomer_log에 백업되었습니다.');
end;
/

-- alterDeleteCustomer
drop trigger afterDeleteCustomer;
create or replace trigger afterDeleteCustomer
after delete on customer for each row
begin
    insert into customer_log
    values(:old.custid, :old.name, :old.address, :old.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),'DELETE_TRIGGER');
    DBMS_OUTPUT.put_line('삭제한 자료가 costomer_log에 백업되었습니다.');
end;
/

-- alterUpdateCustomer
drop trigger afterUpdateCustomer;
create or replace trigger afterUpdateCustomer
after update on customer for each row
begin
    insert into customer_log
    values(:old.custid, :old.name, :old.address, :old.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),'UPDATE_TRIGGER');
    DBMS_OUTPUT.put_line('업데이트 전 자료가 costomer_log에 백업되었습니다.');
end;
/

-- drop triger
drop trigger afterdeletecustomer;
drop trigger afterinsertcustomer;
drop trigger afterupdatecustomer;



set serveroutput on
insert into customer values(7,'송중기','영국','010');

set serveroutput on
delete from customer where custid = 7;


set serveroutput on
update customer
set phone = '010'
where name like '박세리';



---- CRUDCusomter 
drop trigger CRUDCusomter;
create or replace trigger CRUDCusomter
after insert or update or delete on customer for each row
begin
    if inserting then
        insert into customer_log
        values(:new.custid, :new.name, :old.address, :new.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),'INSERT_TRIGGER');
        DBMS_OUTPUT.put_line('입력 된 자료가 CRUDCusomter에 백업되었습니다.');
    elsif updating then
        insert into customer_log
        values(:old.custid, :old.name, :old.address, :old.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),'UPDATE_TRIGGER');
        DBMS_OUTPUT.put_line('업데이트 전 자료가 CRUDCusomter에 백업되었습니다.');
    elsif deleting then
         insert into customer_log
        values(:old.custid, :old.name, :old.address, :old.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),'DELETE_TRIGGER');
        DBMS_OUTPUT.put_line('삭제 된 자료가 CRUDCusomter에 백업되었습니다.');
    end if;
end;
/

set SERVEROUTPUT on
insert into customer values(7,'김병효','호주','010-5647-6325');

set SERVEROUTPUT on
update customer
set address='대한민국 경기도'
where custid=5;

set SERVEROUTPUT on
delete from customer where custid=7;


delete from customer where custid = 7;
select * from customer_log;
drop table customer_log;

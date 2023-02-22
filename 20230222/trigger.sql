-- madang
-- TRIGGER
CREATE TABLE Book_log(
    bookid_l NUMBER,
    bookname_l VARCHAR2(40),
    publisher_l VARCHAR2(40),
    price_l NUMBER);

select * from book_log;

----------------------------------
create or replace trigger AfterInsertBook
-- insert문을 이용하여 book테이블에 트리거 자동 생성
after insert on book for each row
declare --지역변수
        average number;
begin
    -- book에 삽입된 트리거를 book_log에 자동 백업
    insert into book_log 
    values (:new.bookid,:new.bookname,:new.publisher,:new.price);
    DBMS_OUTPUT.put_line('삽입 튜플을 book_log 테이블에 백업 완료');
end;
/

insert into book values(35,'야구의 신','이상미디어',27000);
select * from book where bookid = 35;
select * from book_log;
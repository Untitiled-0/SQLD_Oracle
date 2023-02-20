-- DML :  Data Manipulation Language
-- SELETE FROM  : 데이터 조회하거나 검색하는 명령어
-- INSERT INTO VLAUES : 데이터 삽입
-- UPDATE SET  : 수정, 갱신
-- DELETE FROM  : 삭제

SELECT * FROM BOOK;
SELECT * FROM imported_book;
INSERT INTO book(BOOKID, BOOKNAME, PUBLISHER) VALUES(14, '스포츠 의학','솔데스크');

-- 대량삽입(BULK INSERT)
INSERT INTO book(BOOKID, BOOKNAME, PUBLISHER, PRICE) 
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE FROM imported_book;

INSERT INTO imported_book(BOOKID, BOOKNAME, PUBLISHER, PRICE) 
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE 
FROM book 
WHERE BOOKID BETWEEN 1 AND 14;
------------------------------------------------------------
-- system계정에서 코드
GRANT select, insert, update, delete on soldesk.newbook to madang;
-- madang계정에서 실습
SELECT * FROM SOLDESK.NEWBOOK;

--book table에 있는 데이터를 모두 bulk insert로 newbook에 삽입하시오
insert into soldesk.newbook(bookid, bookname, publisher, price)
select bookid, bookname, publisher, price from book;





-- DML :  Data Manipulation Language
-- SELETE FROM  : ������ ��ȸ�ϰų� �˻��ϴ� ��ɾ�
-- INSERT INTO VLAUES : ������ ����
-- UPDATE SET  : ����, ����
-- DELETE FROM  : ����

SELECT * FROM BOOK;
SELECT * FROM imported_book;
INSERT INTO book(BOOKID, BOOKNAME, PUBLISHER) VALUES(14, '������ ����','�ֵ���ũ');

-- �뷮����(BULK INSERT)
INSERT INTO book(BOOKID, BOOKNAME, PUBLISHER, PRICE) 
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE FROM imported_book;

INSERT INTO imported_book(BOOKID, BOOKNAME, PUBLISHER, PRICE) 
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE 
FROM book 
WHERE BOOKID BETWEEN 1 AND 14;
------------------------------------------------------------
-- system�������� �ڵ�
GRANT select, insert, update, delete on soldesk.newbook to madang;
-- madang�������� �ǽ�
SELECT * FROM SOLDESK.NEWBOOK;

--book table�� �ִ� �����͸� ��� bulk insert�� newbook�� �����Ͻÿ�
insert into soldesk.newbook(bookid, bookname, publisher, price)
select bookid, bookname, publisher, price from book;





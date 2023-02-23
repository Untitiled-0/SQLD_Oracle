SET TRANSACTION ISOLATION 
LEVEL READ COMMITTED;
commit;

SELECT SUM(price) 총액
FROM   madang.Book;


SELECT SUM(price) 총액
FROM   madang.Book;

INSERT INTO madang.Book 
VALUES (23, '테스트2', '테스트출판사', 5500);

commit;
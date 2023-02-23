SET TRANSACTION ISOLATION 
LEVEL SERIALIZABLE;
commit;

SELECT SUM(price) 총액
FROM   madang.Book;


INSERT INTO Book 
VALUES (12, '테스트', '테스트출판사', 5500);


select * from book;

commit;
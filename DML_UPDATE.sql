-- UPDATE SET WHERE
SELECT * FROM CUSTOMER;

UPDATE customer
SET ADDRESS='대한민국 부산'
WHERE CUSTID=5;

update customer
set address=(SELECT ADDRESS FROM customer WHERE NAME like '김연아')
where name like '박세리';

-- DELETE FROM WHERE
select * 
from imported_book
order by bookid;

delete from imported_book
where bookid=22;

delete from imported_book; --테이블만 남아있고 데이타 모두 삭제

-- madang계정에서 작업
-- orders테이블의 가격 변경 
-- 5번 15000 / 7번 20000 / 10번 7000
SELECT * from orders;
update orders 
set saleprice=15000
where bookid=5;

update orders 
set saleprice=20000
where bookid=7;

update orders 
set saleprice=7000
where bookid=10;







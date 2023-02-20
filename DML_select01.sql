-- SELECT FROM WHERE
-- 모든 도서의 이름과 가격을 보이시오
SELECT * FROM BOOK;
SELECT BOOKNAME, PRICE
FROM BOOK;

SELECT  PRICE, BOOKNAME
FROM BOOK;
-- 도서 테이블에 있는 모든 출판사를 검색하시오
SELECT  PUBLISHER
FROM BOOK;
-- 중복되는 데이터 제거 키워드(DISTINCT)
SELECT  DISTINCT PUBLISHER
FROM BOOK;

-- WHERE
SELECT * FROM BOOK
WHERE PRICE <= 8000;

-- 가격이 10,000이상 20,000이하인 도서를 검색하시오
SELECT * FROM BOOK
WHERE PRICE BETWEEN 10000 AND 20000;

SELECT * FROM BOOK
WHERE PRICE >= 10000 AND PRICE <= 20000;

-- 집합
SELECT * FROM BOOK
WHERE publisher in('굿스포츠', '대한미디어');

SELECT * FROM BOOK
WHERE publisher NOT in('굿스포츠', '대한미디어');

-- 패턴
SELECT bookname, publisher
from book
where bookname like '축구의 역사';

SELECT bookname, publisher
from book
where bookname like '%축구%';

SELECT *
from book
where bookname like '_구%';

-- 복합조건
-- 축구에 관한 도서 중 가격이 20000원 이상인 도서의 정보 출력
select *
from book
where bookname like '%축구%' and price >= 20000;
-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오
select *
from book
where publisher like '굿스포츠' or publisher like '대한미디어';

-- 도서를 이름순으로 검색하시오
select * 
from book
ORDER BY bookname ASC;

-- 도서를 가격순으로 정렬하고, 가격이 같으면 이름순으로 검색하시오
select * 
from book
ORDER BY price, bookname;

-- 도서를 가격의 내림차순으로 검색하시오, 만약에 가격이 같으면 출판사의 오름차순으로 검색
select * 
from book
ORDER BY price DESC, bookname ASC;

-- 집계 함수
select * from orders;
select sum(saleprice) as 총매출
from orders;

-- 2번 고객이 주문한 도서의 총 판매액을 보이시오
select sum(saleprice) as "총 판매액"
from orders
where custid=2;

-- 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 보이시오
select sum(saleprice) as "총 판매액",
       avg(saleprice) as 평균값,
       min(saleprice) as 최저가,
       max(saleprice) as 최고가
from orders;

-- 마당서점의 도서 판매 건수를 구하시오
select count(*)
from orders;

-- 마당서점의 도서 판매가격이 20000원 이상인 건수를 구하시오
select count((case when saleprice >= 20000 then 1 end)) as VIP
from orders;

-- 마당서점의 도서 판매가격이 20000원 이상인 건수와 10000원 이하 건수를 구하시오
select count((case when saleprice >= 20000 then 1 end)) as VIP,
       count((case when saleprice <= 10000 then 1 end)) as CS
from orders;

-- Group By 
select custid, saleprice
from orders
order by custid;

-- 고객별로 주문한 도서의 총 판매수량을 보이시오
select custid, count(*) as 판매수량
from orders
group by custid;
-- 고객별로 주문한 도서의 총 판매액을 고객아이디를 기준으로 오름차순으로 보이시오
select custid, sum(saleprice) as 총판매액
from orders
group by custid
order by custid;

-- 가격이 10000원 이상인 도서를 구매한 고객에 대한 고객별 주문도서의 총수량을 보이시오 (단 3권 이상 구매한 고객만 출력)
select custid, count(*) as 판매수량
from orders
where saleprice >= 10000
group by custid
HAVING count(*) >= 3;



























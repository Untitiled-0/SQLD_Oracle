-- book테이블에서 가장 비싼 가격을 보이시오
SELECT
    MAX(price)
FROM
    book;
-- book테이블에서 가장 비싼 가격의 도서이름을 보이시오
SELECT
    bookname
FROM
    book
WHERE
    price LIKE 35000;

SELECT
    bookname
FROM
    book
WHERE
    (
        SELECT
            MAX(price)
        FROM
            book
    ) = price;

-- 구매한 고객의 아이디를 보이시오
SELECT
    custid
FROM
    orders;
-- 도서를 구매한 적이 있는 고객의 이름을 보이시오(중첩질의)
SELECT
    customer.name
FROM
    customer
WHERE
    customer.custid IN (
        SELECT
            custid
        FROM
            orders
    );

-- 대한미디어에서 출판한 도서의 아이디
SELECT
    bookid
FROM
    book
WHERE
    publisher = '대한미디어';

-- 대한미디어에서 출판한 도서를 구매한적이 있는 고객의 아이디
SELECT
    custid
FROM
    customer
WHERE
    custid IN (
        SELECT
            bookid
        FROM
            book
        WHERE
            publisher = '대한미디어'
    );

-- 대한미디어에서 출판한 도서를 구매한적이 있는 고객의 이름
SELECT
    name
FROM
    customer
WHERE
    custid IN (
        SELECT
            custid
        FROM
            orders
        WHERE
            bookid IN (
                SELECT
                    bookid
                FROM
                    book
                WHERE
                    publisher = '대한미디어'
            )
    );

-- EXISTS
-- 구매한 적이 있는 고객의 이름과 주소 정보
select name
SELECT
    *
FROM
    orders   od,
    customer cs
WHERE
    od.custid = cs.custid;

SELECT
    name,
    address
FROM
    customer
WHERE
    EXISTS (
        SELECT
            *
        FROM
            orders   od,
            customer cs
        WHERE
            od.custid = cs.custid
    );
    
-- 상관 부속질의
-- 출판사별로 출판사의 평균 도서의 가격

SELECT
    *
FROM
    book;

SELECT
    publisher,
    AVG(price)
FROM
    book
GROUP BY
    publisher;

SELECT
    *
FROM
    b1;
    
-- 출판사별로 출판사의 평균 도서의 가격보다 더 비싼 도서의 이름과 출판사
SELECT
    b1.publisher,
    b1.bookname,
    b1.price
FROM
    book b1
WHERE
    price > (
        SELECT
            AVG(price)
        FROM
            book b2
        WHERE
            b1.publisher = b1.publisher
    );

SELECT
    b1.publisher,
    b1.bookname,
    b1.price
FROM
    book b1
WHERE
    price > (
        SELECT
            AVG(price)
        FROM
            book b2
        WHERE
            b1.publisher = b1.publisher
    );
               
               
-- 대한민국에 거주하는 고객에게 판매한 도시의 총 판매액을 보이시오
SELECT
    SUM(saleprice)
FROM
         orders od
    INNER JOIN customer cs ON cs.custid = od.custid
                              AND TRIM(address) LIKE '%대한민국%';
               
-- 중첩
SELECT
    SUM(saleprice)
FROM
    orders od
WHERE
    custid IN (
        SELECT
            custid
        FROM
            customer
        WHERE
            address LIKE '%대한민국%'
    );
                            
                            
-- 대한민국에 거주하지 않는 고객에게 판매한 도서의총 판매액을 보이시오

SELECT
    SUM(saleprice)
FROM
    orders od
WHERE
    custid NOT IN (
        SELECT
            custid
        FROM
            customer
        WHERE
            address LIKE '%대한민국%'
    );

SELECT
    SUM(saleprice)
FROM
    orders od
WHERE
    EXISTS (
        SELECT
            *
        FROM
            customer cs
        WHERE
                cs.custid = od.custid
            AND address LIKE '%대한민국%'
    );

------------------------------------------------
-- all, some
-- 3번 고객이 주문한 도서의 판매가격

SELECT
    saleprice
FROM
    orders
WHERE
    custid LIKE 3;

-- 3번 고객이 주문한 도서의 최고 가격 보다 더 비싼 도서를 구입한 주문번호와 판매가격을 보이시오

-- and
SELECT
    orderid,
    saleprice
FROM
    orders
WHERE
    saleprice > ALL (
        SELECT
            saleprice
        FROM
            orders
        WHERE
            custid LIKE 3
    );

SELECT
    orderid,
    saleprice
FROM
    orders
WHERE
    saleprice > ALL (
        SELECT
            saleprice
        FROM
            orders
        WHERE
            custid LIKE 3
    );
    

-- 3번 고객이 주문한 도서의 판매가격 중 하나라도 더 비싼 도서를 구입한 주문번호와 판매가격을 보이시오
-- or
SELECT
    orderid,
    saleprice
FROM
    orders
WHERE
    saleprice > SOME (
        SELECT
            saleprice
        FROM
            orders
        WHERE
            custid LIKE 3
    );
    
    
    
    
    

-- 집합연산
-- 차집합(MINUS), 합집합(UNION), 교집합(INTERSECT)
-- 도서를 주문하지 않은 고객의 이름을 보이시오

SELECT
    name
FROM
    customer
MINUS
SELECT
    name
FROM
    customer
WHERE
    custid IN (
        SELECT
            custid
        FROM
            orders
    );


    
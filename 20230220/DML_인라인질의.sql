-- 고객의 ID가 2번 이하의 고객에 대한 이름과 총 판매액
-- 조인

SELECT
    name,
    SUM(saleprice)
FROM
    customer cs,
    orders   od
WHERE
        cs.custid = od.custid
    AND cs.custid <= 2
GROUP BY
    cs.name;

-- 인라인 질의 : 테이블의 크기를 축소하여 성능향상 검색

-- 유사 테이블이다.

SELECT
    custid,
    name
FROM
    customer
WHERE
    custid <= 2;

-- 빅데이터에서 사용

SELECT
    cs.name,
    SUM(saleprice) total
FROM
    (
        SELECT
            custid,
            name
        FROM
            customer
        WHERE
            custid <= 2
    )      cs,
    orders od
WHERE
    cs.custid = od.custid
GROUP BY
    cs.name;

-- 중첩
-- 고객의 ID가 3번 이하의 고객에 대한 아이디와 총 판매액

-- in : null이뜨면 false
-- exists : null이떠도 true, where문에 exists만 사용하고 ();

-- in 
select od.custid, sum(od.saleprice)
from orders od
where od.custid in ( select cs.custid
                        from customer cs
                        where cs.custid = od.custid and od.custid <= 3
                        ) 
group by od.custid;


-- exists
select od.custid, sum(od.saleprice) 
from orders od
where exists ( select cs.custid
                        from customer cs
                        where cs.custid = od.custid and od.custid <= 3
                        ) 
group by od.custid;



--------------------------------------------------
-- 주문 내역이 있는 고객의 이름, 각 고객별 주문 금액의 평균
-- 조인

SELECT
    cs.name,
    AVG(saleprice) avge
FROM
         customer cs
    JOIN orders od ON cs.custid = od.custid
GROUP BY
    cs.name;

-- 인라인
SELECT
    name,
    od.average
FROM
    (
        SELECT
            custid,
            AVG(saleprice) average
        FROM
            orders
        GROUP BY
            custid
    )        od,
    customer cs
WHERE
    cs.custid = od.custid;
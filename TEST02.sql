SELECT  *
FROM  order_2;

SELECT *
FROM customer_2;

SELECT *
FROM salesperson;

-- 모든 판매원의 이름과 급여를 보이시오. 단, 중복행 제거

SELECT DISTINCT  name,  salary
FROM  salesperson s
WHERE name = s.name;


-- 나이가 30세 미만인 판매원의 이름을 보이시오

SELECT name
FROM salesperson s
WHERE 30 < s.age;


-- A자로 끝나는 도시에 사는 고객의 이름을 보이시오

SELECT name
FROM customer_2 c
WHERE  TRIM (c.CITY) LIKE '%a';


-- 판매원별 주문수를 계산하시오.

SELECT SALESPERSON, COUNT(salesperson)
FROM ORDER_2
GROUP BY salesperson;

SELECT SALESPERSON, COUNT(*)
FROM ORDER_2
GROUP BY SALESPERSON;



-- 'LA'에 사는 고객으로부터 주문을 받은 판매원 이름과 나이를 보이시오 ( 부속질의를 사용 )
-- 1. LA에 사는 고객
-- 2. 고객이 주문한 판매원
-- 3. 판매원의 이름, 나이



SELECT name
FROM customer_2 c
WHERE  c.city LIKE 'LA';

SELECT name, age
FROM salesperson
WHERE name IN ( -- 정보를 받으려면 같은 타입으로 선언을 해야한다.
    SELECT salesperson 
    FROM ORDER_2
    WHERE custname IN (
                SELECT name
                FROM customer_2 c
                WHERE c.city LIKE 'LA'
            )
    );
    
SELECT DISTINCT NAME, AGE
FROM SALESPERSON
WHERE NAME IN (SELECT SALESPERSON 
                            FROM CUSTOMER_2
                            INNER JOIN ORDER_2 ON ORDER_2.CUSTNAME = CUSTOMER_2.NAME
                            WHERE CITY = 'LA');
    
    
    
    

-- 'LA'에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오 ( 조인을 사용 ).

--  조건 : 고객은 'LA'에 사는 사람

-- 1. 주문한 고객 = 고객 이름
-- 2. 주문한 고객 = 판매원 이름
-- 3. 판매원의 이름, 나이

SELECT SALESPERSON.NAME, SALESPERSON.AGE
FROM ORDER_2 
JOIN CUSTOMER_2 ON ORDER_2.custname = CUSTOMER_2.NAME
JOIN SALESPERSON ON ORDER_2.SALESPERSON = SALESPERSON.NAME
WHERE CUSTOMER_2.CITY LIKE 'LA';
    
SELECT SALESPERSON, AGE
FROM SALESPERSON SA, ORDER_2 OD2, CUSTOMER_2 CS2
WHERE SA.NAME = OD2.SALESPERSON AND od2.custname = CS2.NAME
AND TRIM(CITY) LIKE 'LA';



--  두 번 이상 주문을 받은 판매원의 이름을 보이시오. (GROUP BY)


SELECT NAME
FROM salesperson S
WHERE 2 <= (SELECT COUNT (ORDER_2.salesperson)
FROM ORDER_2
GROUP BY S.NAME);

SELECT SALESPERSON, COUNT(*)
FROM ORDER_2
GROUP BY SALESPERSON
HAVING COUNT (*)>3;



-- DANIEL의 급여를 4500원으로 변경 하시오 (UPDATE SET)

UPDATE salesperson s
SET s.salary = '4500'
WHERE s.name = 'daniel';

SELECT  *
FROM salesperson s
WHERE s.name = 'daniel';
SELECT  *
FROM  order_2;

SELECT *
FROM customer_2;

SELECT *
FROM salesperson;

-- ��� �Ǹſ��� �̸��� �޿��� ���̽ÿ�. ��, �ߺ��� ����

SELECT DISTINCT  name,  salary
FROM  salesperson s
WHERE name = s.name;


-- ���̰� 30�� �̸��� �Ǹſ��� �̸��� ���̽ÿ�

SELECT name
FROM salesperson s
WHERE 30 < s.age;


-- A�ڷ� ������ ���ÿ� ��� ���� �̸��� ���̽ÿ�

SELECT name
FROM customer_2 c
WHERE  TRIM (c.CITY) LIKE '%a';


-- �Ǹſ��� �ֹ����� ����Ͻÿ�.

SELECT SALESPERSON, COUNT(salesperson)
FROM ORDER_2
GROUP BY salesperson;

SELECT SALESPERSON, COUNT(*)
FROM ORDER_2
GROUP BY SALESPERSON;



-- 'LA'�� ��� �����κ��� �ֹ��� ���� �Ǹſ� �̸��� ���̸� ���̽ÿ� ( �μ����Ǹ� ��� )
-- 1. LA�� ��� ��
-- 2. ���� �ֹ��� �Ǹſ�
-- 3. �Ǹſ��� �̸�, ����



SELECT name
FROM customer_2 c
WHERE  c.city LIKE 'LA';

SELECT name, age
FROM salesperson
WHERE name IN ( -- ������ �������� ���� Ÿ������ ������ �ؾ��Ѵ�.
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
    
    
    
    

-- 'LA'�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ���̸� ���̽ÿ� ( ������ ��� ).

--  ���� : ���� 'LA'�� ��� ���

-- 1. �ֹ��� �� = �� �̸�
-- 2. �ֹ��� �� = �Ǹſ� �̸�
-- 3. �Ǹſ��� �̸�, ����

SELECT SALESPERSON.NAME, SALESPERSON.AGE
FROM ORDER_2 
JOIN CUSTOMER_2 ON ORDER_2.custname = CUSTOMER_2.NAME
JOIN SALESPERSON ON ORDER_2.SALESPERSON = SALESPERSON.NAME
WHERE CUSTOMER_2.CITY LIKE 'LA';
    
SELECT SALESPERSON, AGE
FROM SALESPERSON SA, ORDER_2 OD2, CUSTOMER_2 CS2
WHERE SA.NAME = OD2.SALESPERSON AND od2.custname = CS2.NAME
AND TRIM(CITY) LIKE 'LA';



--  �� �� �̻� �ֹ��� ���� �Ǹſ��� �̸��� ���̽ÿ�. (GROUP BY)


SELECT NAME
FROM salesperson S
WHERE 2 <= (SELECT COUNT (ORDER_2.salesperson)
FROM ORDER_2
GROUP BY S.NAME);

SELECT SALESPERSON, COUNT(*)
FROM ORDER_2
GROUP BY SALESPERSON
HAVING COUNT (*)>3;



-- DANIEL�� �޿��� 4500������ ���� �Ͻÿ� (UPDATE SET)

UPDATE salesperson s
SET s.salary = '4500'
WHERE s.name = 'daniel';

SELECT  *
FROM salesperson s
WHERE s.name = 'daniel';
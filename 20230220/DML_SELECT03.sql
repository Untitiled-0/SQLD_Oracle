-- book���̺��� ���� ��� ������ ���̽ÿ�
SELECT
    MAX(price)
FROM
    book;
-- book���̺��� ���� ��� ������ �����̸��� ���̽ÿ�
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

-- ������ ���� ���̵� ���̽ÿ�
SELECT
    custid
FROM
    orders;
-- ������ ������ ���� �ִ� ���� �̸��� ���̽ÿ�(��ø����)
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

-- ���ѹ̵��� ������ ������ ���̵�
SELECT
    bookid
FROM
    book
WHERE
    publisher = '���ѹ̵��';

-- ���ѹ̵��� ������ ������ ���������� �ִ� ���� ���̵�
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
            publisher = '���ѹ̵��'
    );

-- ���ѹ̵��� ������ ������ ���������� �ִ� ���� �̸�
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
                    publisher = '���ѹ̵��'
            )
    );

-- EXISTS
-- ������ ���� �ִ� ���� �̸��� �ּ� ����
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
    
-- ��� �μ�����
-- ���ǻ纰�� ���ǻ��� ��� ������ ����

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
    
-- ���ǻ纰�� ���ǻ��� ��� ������ ���ݺ��� �� ��� ������ �̸��� ���ǻ�
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
               
               
-- ���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���̽ÿ�
SELECT
    SUM(saleprice)
FROM
         orders od
    INNER JOIN customer cs ON cs.custid = od.custid
                              AND TRIM(address) LIKE '%���ѹα�%';
               
-- ��ø
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
            address LIKE '%���ѹα�%'
    );
                            
                            
-- ���ѹα��� �������� �ʴ� ������ �Ǹ��� �������� �Ǹž��� ���̽ÿ�

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
            address LIKE '%���ѹα�%'
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
            AND address LIKE '%���ѹα�%'
    );

------------------------------------------------
-- all, some
-- 3�� ���� �ֹ��� ������ �ǸŰ���

SELECT
    saleprice
FROM
    orders
WHERE
    custid LIKE 3;

-- 3�� ���� �ֹ��� ������ �ְ� ���� ���� �� ��� ������ ������ �ֹ���ȣ�� �ǸŰ����� ���̽ÿ�

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
    

-- 3�� ���� �ֹ��� ������ �ǸŰ��� �� �ϳ��� �� ��� ������ ������ �ֹ���ȣ�� �ǸŰ����� ���̽ÿ�
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
    
    
    
    
    

-- ���տ���
-- ������(MINUS), ������(UNION), ������(INTERSECT)
-- ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�

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


    
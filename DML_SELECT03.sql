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


    
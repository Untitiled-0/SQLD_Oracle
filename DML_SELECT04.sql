-- �������� ������ ������ ���ǻ�(INNER JOIN)
-- ����Ŭ

SELECT DISTINCT
    publisher
FROM
    book     bk,
    orders   od,
    customer cs
WHERE
        bk.bookid = od.bookid
    AND od.custid = cs.custid
    AND cs.name LIKE '������';


-- AN : �ڽ����̺��� ���� INNER JOIN�� �Ѵ�.
SELECT DISTINCT
    publisher
FROM
         orders od
    INNER JOIN book     bk ON bk.bookid = od.bookid
    INNER JOIN customer cs ON od.custid = cs.custid
                              AND cs.name LIKE '������';

SELECT
    *
FROM
    orders;
-- �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸� ( �� �������� ���� )

SELECT DISTINCT
    name
FROM
    book     bk1,
    orders   od1,
    customer cs1
WHERE
        bk1.bookid = od1.bookid
    AND od1.custid = cs1.custid
--    AND cs1.name LIKE '������'
    AND bk1.publisher IN (
        SELECT DISTINCT
            publisher
        FROM
            book     bk2, orders   od2, customer cs2
        WHERE
                bk2.bookid = od2.bookid
            AND od2.custid = cs2.custid
            AND cs2.name LIKE '������'
            AND cs1.name NOT LIKE '������'
    );

-- ANSI

SELECT DISTINCT
    name
FROM
         orders od1
    INNER JOIN book     bk1 ON bk1.bookid = od1.bookid
    INNER JOIN customer cs1 ON od1.custid = cs1.custid
                               AND bk1.bookid = od1.bookid
                               AND od1.custid = cs1.custid
--    AND cs1.name LIKE '������'
                               AND bk1.publisher IN (
        SELECT DISTINCT
            publisher
        FROM
                 orders od2
            INNER JOIN book     bk2 ON bk2.bookid = od2.bookid
            INNER JOIN customer cs2 ON od2.custid = cs2.custid
                                       AND cs2.name LIKE '������'
                                       AND cs1.name NOT LIKE '������'
    );
    
-- ANSI

SELECT DISTINCT
    publisher
FROM
         orders od
    INNER JOIN book     bk ON bk.bookid = od.bookid
    INNER JOIN customer cs ON od.custid = cs.custid
                              AND cs.name LIKE '������';
                              
                              
-- �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�

SELECT * FROM customer;
SELECT * FROM ORDERS;
SELECT * FROM BOOK;

SELECT NAME
FROM CUSTOMER CS1
WHERE 2 <= (SELECT  COUNT ( DISTINCT  PUBLISHER)
FROM BOOK BK2, ORDERS OD2, CUSTOMER CS2
WHERE BK2.BOOKID = OD2.BOOKID AND OD2.CUSTID = CS2.CUSTID AND ( CS2.NAME = CS1.NAME));

-- (.
CS2.NAME = CS1.NAME) : �̸��� GROUP BY
                              
      

                              
                              
                              
-- SELECT FROM WHERE
-- ��� ������ �̸��� ������ ���̽ÿ�

SELECT * FROM BOOK;


SELECT BOOKNAME, PRICE FROM BOOK;

SELECT publisher FROM BOOK;

-- �ߺ��Ǵ� ������ ���� Ű���� (DINSTINCT)

SELECT DISTINCT PUBLISHER
FROM BOOK;

-- WHERE 
SELECT * FROM BOOK
WHERE PRICE <= 8000;

SELECT * FROM BOOK
WHERE PRICE BETWEEN 10000 AND 20000 ;

-- ����

SELECT * FROM BOOK
WHERE publisher NOT IN ('�½�����','���ѹ̵��');

-- ����

SELECT BOOKNAME, PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE '�౸�� ����';


SELECT BOOKNAME, PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE '_��%';


-- �౸�� ���� ���� �� ������ 2���� �̻�

SELECT BOOKNAME, PUBLISHER, PRICE
FROM BOOK
WHERE BOOKNAME LIKE '%�౸%' AND PRICE >=20000;

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�

SELECT * FROM BOOK
WHERE publisher IN ('�½�����','���ѹ̵��');


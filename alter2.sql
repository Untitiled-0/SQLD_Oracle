DROP TABLE userinfo;

SELECT
    *
FROM
    userinfo;

CREATE TABLE userinfo (
    id      INT NOT NULL,
    name    VARCHAR(20),
    loginid VARCHAR(20),
    email   VARCHAR(20)
);

DROP TABLE depart;

SELECT
    *
FROM
    depart;

CREATE TABLE depart (
    id         INT NOT NULL,
    depart_nm  VARCHAR(20),
    depart_tel VARCHAR(20)
);

-- Alter -> ��������

-- primary key ��������
ALTER TABLE userinfo ADD PRIMARY KEY ( id );

ALTER TABLE depart ADD PRIMARY KEY ( id );

-- foregin key �������� 
ALTER TABLE depart
    ADD CONSTRAINT user_fk FOREIGN KEY ( id )
        REFERENCES depart ( id )
            ON DELETE CASCADE;

-- foregin key �������� ����
ALTER TABLE depart DROP CONSTRAINT user_fk;

-- not null �������� (depart_tel)
ALTER TABLE depart MODIFY
    depart_tel VARCHAR(20) NOT NULL;

--------------------------------------------------

DROP TABLE newbook;

CREATE TABLE newbook (
    bookid    NUMBER,
    bookname  VARCHAR2(40),
    publisher VARCHAR2(40),
    price     NUMBER
);

DROP TABLE neworders;

CREATE TABLE neworders (
    orderid   NUMBER,
    custid    NUMBER,
    bookid    NUMBER,
    saleprice NUMBER,
    orderdate DATE
);

DROP TABLE newcustomer;

CREATE TABLE newcustomer (
    custid  NUMBER,
    name    VARCHAR2(40),
    address VARCHAR2(40),
    phone   NUMBER
);


-- primary key ��������
ALTER TABLE newbook ADD PRIMARY KEY ( bookid );

ALTER TABLE newcustomer ADD PRIMARY KEY ( custid );

ALTER TABLE neworders ADD PRIMARY KEY ( orderid );

-- bookid�� not null
ALTER TABLE newbook MODIFY
    bookid NUMBER NOT NULL;

-- Foreign key (newworders => newcustoter, newbook)
ALTER TABLE neworders DROP CONSTRAINT neworders_fk;

ALTER TABLE neworders
    ADD CONSTRAINT newcustomer_fk FOREIGN KEY ( custid )
        REFERENCES newcustomer ( custid );

ALTER TABLE neworders
    ADD CONSTRAINT newbook_fk FOREIGN KEY ( bookid )
        REFERENCES newbook ( bookid );

-- ���� �߰� ���� 
SELECT
    *
FROM
    tb_newbook;
---------------------------------------------
DESCRIBE newbook; -- ���̺�  ��� ������ ������ ��
desc newbook; -- ����
---------------------------------------------
-- ���̺�� ����
ALTER TABLE newbook RENAME TO tb_newbook;

-- ���̺� �Ӽ� �߰�
ALTER TABLE tb_newbook ADD isbn VARCHAR2(20);

-- �Ӽ� Ÿ�� ����
ALTER TABLE tb_newbook MODIFY
    isbn NUMBER;

-- �÷��� ����
ALTER TABLE tb_newbook RENAME COLUMN isbn TO iss;

-- �÷� ����
ALTER TABLE tb_newbook DROP COLUMN iss;




SELECT
    *
FROM
    newcustomer;

SELECT
    *
FROM
    neworders;
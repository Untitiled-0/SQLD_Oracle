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

-- Alter -> 제약조건

-- primary key 제약조건
ALTER TABLE userinfo ADD PRIMARY KEY ( id );

ALTER TABLE depart ADD PRIMARY KEY ( id );

-- foregin key 제약조건 
ALTER TABLE depart
    ADD CONSTRAINT user_fk FOREIGN KEY ( id )
        REFERENCES depart ( id )
            ON DELETE CASCADE;

-- foregin key 제약조건 삭제
ALTER TABLE depart DROP CONSTRAINT user_fk;

-- not null 제약조건 (depart_tel)
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


-- primary key 제약조건
ALTER TABLE newbook ADD PRIMARY KEY ( bookid );

ALTER TABLE newcustomer ADD PRIMARY KEY ( custid );

ALTER TABLE neworders ADD PRIMARY KEY ( orderid );

-- bookid에 not null
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

-- 변경 추가 삭제 
SELECT
    *
FROM
    tb_newbook;
---------------------------------------------
DESCRIBE newbook; -- 테이블  요약 정보가 나오는 것
desc newbook; -- 동일
---------------------------------------------
-- 테이블명 변경
ALTER TABLE newbook RENAME TO tb_newbook;

-- 테이블 속성 추가
ALTER TABLE tb_newbook ADD isbn VARCHAR2(20);

-- 속성 타입 변경
ALTER TABLE tb_newbook MODIFY
    isbn NUMBER;

-- 컬럼명 변경
ALTER TABLE tb_newbook RENAME COLUMN isbn TO iss;

-- 컬럼 삭제
ALTER TABLE tb_newbook DROP COLUMN iss;




SELECT
    *
FROM
    newcustomer;

SELECT
    *
FROM
    neworders;
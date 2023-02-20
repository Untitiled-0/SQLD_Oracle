-- 생성자 Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   위치:        2023-02-20 17:06:30 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE 고객 (
    고객주민번호 VARCHAR2(20) NOT NULL,
    고객명    VARCHAR2(20),
    고객생년월일 VARCHAR2(20),
    고객이메일  VARCHAR2(20),
    고객전화번호 VARCHAR2(20),
    고객직업   VARCHAR2(20)
);

ALTER TABLE 고객 ADD CONSTRAINT 고객_pk PRIMARY KEY ( 고객주민번호 );

CREATE TABLE 예금계좌 (
    예금계좌id    NUMBER(8) NOT NULL,
    예금계좌종류    VARCHAR2(20),
    예금잔고      NUMBER(20),
    카드신청여부    CHAR(1),
    예금개설일     VARCHAR2(20),
    예금자이름     VARCHAR2(20),
    전화번호      VARCHAR2(20),
    이메일       VARCHAR2(20),
    고객주민번호    VARCHAR2(20),
    고객_고객주민번호 VARCHAR2(20) NOT NULL
);

ALTER TABLE 예금계좌 ADD CONSTRAINT 예금계좌_pk PRIMARY KEY ( 예금계좌id );

CREATE TABLE 예금계좌거래내역 (
    예금계좌id      NUMBER(8) NOT NULL,
    입출금날짜       DATE,
    거래번호        VARCHAR2(20),
    예금구분        VARCHAR2(20),
    예금내용        VARCHAR2(20),
    거래금액        NUMBER(20),
    예금잔고        NUMBER(20),
    예금계좌_예금계좌id NUMBER(8) NOT NULL
);

ALTER TABLE 예금계좌거래내역 ADD CONSTRAINT 예금계좌거래내역_pk PRIMARY KEY ( 예금계좌id );

CREATE TABLE 카드 (
    카드id        NUMBER(8) NOT NULL,
    카드신청일자      VARCHAR2(20),
    카드한도금액      NUMBER(10),
    카드결재일자      VARCHAR2(20),
    카드종류        VARCHAR2(20),
    고객주민번호      VARCHAR2(20),
    예금계좌id      VARCHAR2(20),
    고객_고객주민번호   VARCHAR2(20) NOT NULL,
    예금계좌_예금계좌id NUMBER(8) NOT NULL
);

ALTER TABLE 카드 ADD CONSTRAINT 카드_pk PRIMARY KEY ( 카드id );

ALTER TABLE 예금계좌
    ADD CONSTRAINT 예금계좌_고객_fk FOREIGN KEY ( 고객_고객주민번호 )
        REFERENCES 고객 ( 고객주민번호 );

ALTER TABLE 예금계좌거래내역
    ADD CONSTRAINT 예금계좌거래내역_예금계좌_fk FOREIGN KEY ( 예금계좌_예금계좌id )
        REFERENCES 예금계좌 ( 예금계좌id );

ALTER TABLE 카드
    ADD CONSTRAINT 카드_고객_fk FOREIGN KEY ( 고객_고객주민번호 )
        REFERENCES 고객 ( 고객주민번호 );

ALTER TABLE 카드
    ADD CONSTRAINT 카드_예금계좌_fk FOREIGN KEY ( 예금계좌_예금계좌id )
        REFERENCES 예금계좌 ( 예금계좌id );




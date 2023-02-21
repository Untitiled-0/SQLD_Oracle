-- 생성자 Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   위치:        2023-02-21 10:48:58 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g


-- 부모 테이블의 제약조건 해제하고 삭제됨
drop table 극장 cascade constraints;
drop table 고객 cascade constraints;
drop table 상영관 cascade constraints;
drop table 예약 cascade constraints;



CREATE TABLE 고객 (
    고객번호 NUMBER(10) NOT NULL,
    이름   VARCHAR2(20),
    주소   VARCHAR2(40)
);

ALTER TABLE 고객 ADD CONSTRAINT 고객_pk PRIMARY KEY ( 고객번호 );

CREATE TABLE 극장 (
    극장번호 NUMBER(20) NOT NULL,
    극장이름 VARCHAR2(20),
    위치   VARCHAR2(20)
);

ALTER TABLE 극장 ADD CONSTRAINT 극장_pk PRIMARY KEY ( 극장번호 );

CREATE TABLE 상영관 (
    상영관번호 NUMBER(10) NOT NULL,
    극장번호  NUMBER(10) NOT NULL,
    영화제목  VARCHAR2(20),
    가격    NUMBER(20),
    좌석수   NUMBER(20)
);

ALTER TABLE 상영관 ADD CONSTRAINT 상영관_pk PRIMARY KEY ( 상영관번호 );

CREATE TABLE 예약 (
    좌석번호  NUMBER(10) NOT NULL,
    상영관번호 NUMBER(10) NOT NULL,
    고객번호  NUMBER(10) NOT NULL,
    날짜    DATE
);

ALTER TABLE 예약 ADD CONSTRAINT 예약_pk PRIMARY KEY ( 좌석번호 );

ALTER TABLE 상영관
    ADD CONSTRAINT 상영관_극장_fk FOREIGN KEY ( 극장번호 )
        REFERENCES 극장 ( 극장번호 );

ALTER TABLE 예약
    ADD CONSTRAINT 예약_고객_fk FOREIGN KEY ( 고객번호 )
        REFERENCES 고객 ( 고객번호 );

ALTER TABLE 예약
    ADD CONSTRAINT 예약_상영관_fk FOREIGN KEY ( 상영관번호 )
        REFERENCES 상영관 ( 상영관번호 );




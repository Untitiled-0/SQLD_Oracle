-- 생성자 Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   위치:        2023-02-21 09:56:36 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE 강좌 (
    강좌번호   NUMBER(8) NOT NULL,
    강좌명    VARCHAR2(20),
    취득학점   VARCHAR2(20),
    담당교수번호 VARCHAR2(20),
    강의시간   VARCHAR2(20),
    강의실    VARCHAR2(20)
);

ALTER TABLE 강좌 ADD CONSTRAINT 강좌_pk PRIMARY KEY ( 강좌번호 );

CREATE TABLE 교수 (
    교수번호    NVARCHAR2(1) NOT NULL,
    학과번호    NUMBER(8),
    강좌번호    NUMBER(8),
    주민번호    VARCHAR2(20),
    주소      VARCHAR2(20),
    교수이름    VARCHAR2(20),
    전화번호    VARCHAR2(20),
    이메일     VARCHAR2(20),
    사진      VARCHAR2(20),
    강좌_강좌번호 NUMBER(8) NOT NULL,
    학과_학과번호 NUMBER(8) NOT NULL
);

ALTER TABLE 교수 ADD CONSTRAINT 교수_pk PRIMARY KEY ( 교수번호 );

CREATE TABLE 수강내역 (
    과목코드    NUMBER(8) NOT NULL,
    강좌번호    NUMBER(8),
    학생번호    NUMBER(8),
    교수번호    NUMBER(8),
    학과번호    NUMBER(8),
    학점      VARCHAR2(20),
    강좌_강좌번호 NUMBER(8) NOT NULL,
    학생_학생번호 NUMBER(8) NOT NULL,
    학생_교수번호 NUMBER(8) NOT NULL,
    학생_학과번호 NUMBER(8) NOT NULL,
    학생_강좌번호 NUMBER(8) NOT NULL
);

ALTER TABLE 수강내역 ADD CONSTRAINT 수강내역_pk PRIMARY KEY ( 과목코드 );

CREATE TABLE 학과 (
    학과번호 NUMBER(8) NOT NULL,
    학과명  VARCHAR2(20),
    전화번호 VARCHAR2(20)
);

ALTER TABLE 학과 ADD CONSTRAINT 학과_pk PRIMARY KEY ( 학과번호 );

CREATE TABLE 학생 (
    학생번호    NUMBER(8) NOT NULL,
    교수번호    NUMBER(10),
    학과번호    NUMBER(8),
    강좌번호    NUMBER(8),
    학생이름    VARCHAR2(20),
    주민번호    VARCHAR2(20),
    "학년/학기" VARCHAR2(20),
    주소      VARCHAR2(20),
    전화번호    VARCHAR2(20),
    이메일     VARCHAR2(20),
    사진      VARCHAR2(20),
    학과_학과번호 NUMBER(8) NOT NULL,
    교수_교수번호 NVARCHAR2(1) NOT NULL
);

ALTER TABLE 학생 ADD CONSTRAINT 학생_pk PRIMARY KEY ( 학생번호 );

ALTER TABLE 교수
    ADD CONSTRAINT 교수_강좌_fk FOREIGN KEY ( 강좌_강좌번호 )
        REFERENCES 강좌 ( 강좌번호 );

ALTER TABLE 교수
    ADD CONSTRAINT 교수_학과_fk FOREIGN KEY ( 학과_학과번호 )
        REFERENCES 학과 ( 학과번호 );

ALTER TABLE 수강내역
    ADD CONSTRAINT 수강내역_강좌_fk FOREIGN KEY ( 강좌_강좌번호 )
        REFERENCES 강좌 ( 강좌번호 );

ALTER TABLE 수강내역
    ADD CONSTRAINT 수강내역_학생_fk FOREIGN KEY ( 학생_학생번호 )
        REFERENCES 학생 ( 학생번호 );

ALTER TABLE 학생
    ADD CONSTRAINT 학생_교수_fk FOREIGN KEY ( 교수_교수번호 )
        REFERENCES 교수 ( 교수번호 );

ALTER TABLE 학생
    ADD CONSTRAINT 학생_학과_fk FOREIGN KEY ( 학과_학과번호 )
        REFERENCES 학과 ( 학과번호 );




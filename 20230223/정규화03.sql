-- 정규화 실습 
drop table 도서주문;
create table 도서주문(
주문번호 number(30) primary key,
주문날짜 date,
회원이름 varchar(20),
회원번호 varchar(10),
회원주소 varchar(40),
전화번호 varchar(20),
도서_SNO number(30),
도서명 varchar(40),
수량 number(30),
단가 number(30)
);

create table 주문내역(
주문번호 number(30) primary key,
주문날짜 date,
회원번호 varchar(10),
도서_SNO number(30),
FOREIGN KEY (회원번호)  REFERENCES  회원(회원번호),
FOREIGN KEY (도서_SNO)  REFERENCES  도서정보(도서_SNO)
);

create table 도서정보(
도서_SNO number(30),
도서명 varchar(30),
수량 number(30),
단가 number(30)
);

create table 회원(
회원이름 varchar(20),
회원번호 varchar(10),
회원주소 varchar(40),
전화번호 varchar(20)
);

--ALTER TABLE 주문내역 FOREIGN KEY(회원번호) REFERENCES 회원(회원번호);
--ALTER TABLE 주문내역 FOREIGN KEY(도서_SNO) REFERENCES 도서정보(도서_SNO);


-- 제 3 정규화
/*
CREATE TABLE 회원테이블(
	회원번호 VARCHAR2(10) PRIMARY KEY,
	회원이름 VARCHAR2(10),
	회원주소 VARCHAR2(40),
	전화번호 VARCHAR2(20)
);

CREATE TABLE 주문내역테이블(
	주문번호 NUMBER(30) PRIMARY KEY,
	주문날짜 DATE,
	회원번호 VARCHAR2(10),
	도서_SNO NUMBER(30)
);

CREATE TABLE 도서정보테이블(
	도서_SNO NUMBER(30) PRIMARY KEY,
	도서명 VARCHAR2(30),
	수량 NUMBER(30),
	단가 NUMBER(30)
);

ALTER TABLE 주문내역테이블 FOREIGN KEY(회원번호) REFERENCES 회원테이블(회원번호);
ALTER TABLE 주문내역테이블 FOREIGN KEY(도서_SNO) REFERENCES 도서정보테이블(도서_SNO);
*/



select * from 도서주문;

insert into 도서주문 values(20190213123,to_date('2019-02-13','yyyy-mm-dd'),'lee','L-123','서울 강남구','010-3664-1234',9788123,'NoSQL의 진수를 만나다',1,25000);
insert into 도서주문 values(20190509238,to_date('2019-05-09','yyyy-mm-dd'),'park','P-234','서울 성동구','010-5301-3456',97889234,'데이터베이스 개론과 실습',1,27000);
insert into 도서주문 values(20190509239,to_date('2019-05-09','yyyy-mm-dd'),'Park','P-234','서울 성동구','010-5301-3456',97889234,'JAVA for Beginner',2,18000);
insert into 도서주문 values(20190721376,to_date('2019-07-21','yyyy-mm-dd'),'Kim','K-345','경기도 용인','010-7341-2345',97889345,'정보보안 개론과 실습',5,24000);
insert into 도서주문 values(20190729401,to_date('2019-07-29','yyyy-mm-dd'),'Nam','n-456','강원도 속초','010-9279-3456',97889234,'데이터베이스 개론과 실습',1,27000);
insert into 도서주문 values(20191005456,to_date('2019-10-05','yyyy-mm-dd'),'Park','P-234','서울 성동구','010-5301-3456',97889567,'오라클 프로그래밍',4,27000);









-- 환자번호, 환자이름, 병동이름, 병실번호
-- 처방, 복용법, 약이름, 약번호, 용량, 시작일,종료일

-- 환자 : 환자번호(P), 환자이름,  병동번호, 병실번호

-- 병동 :  병동번호(P), 병실번호, 환자번호(F)

-- 약 : 약번호(P), 약이름, 처방, 용량, 복용법

-- 처방 : 환자번호(P), 약번호(F), 시작일, 종료일










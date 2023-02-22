/*
start with : 시퀀스의 시작값(생략가능 무조건 1부터 시작)
increment by : 증가값
minvalue 1 : 임계구역의 최소값
maxvalue 9999 : 임계구역의 최대값
cycle : 9999까지 찍고 다시 1부터 반복 
nocycle : 반복없음
cache : 이전에 사용했던 메모리가 유지됨
nocache : 속도향상
*/
-- 기본 시퀀스
create SEQUENCE Update_sequence
  INCREMENT BY 1 MAXVALUE 5000 CYCLE;

-- 증가 시퀀스
drop SEQUENCE seq_test;

create SEQUENCE seq_test
start with 1
increment by 1
minvalue 1
maxvalue 9999
cycle nocache
;
/*
timestamp : date 타입의 확장(year, month, day, hour, minute, second)
with time zone : GMT 표준기간을 기준으로 시차 적용
default systimestamp : 데이터베이스가 상주하는 시스템 시간에 맞춤
*/
create table emp_seq(
id number,
name varchar2(20),
day timestamp with time zone default systimestamp
);

select * from emp_seq;

insert into emp_seq values(seq_test.nextval, '김민주',default);
insert into emp_seq values(seq_test.nextval, '박수',default);
insert into emp_seq values(seq_test.nextval, '이민환',default);

------------------------------------------------------------------
-- 감소 시퀀스
create SEQUENCE seq_test2
start with 1000
increment by -1
minvalue 1
maxvalue 1000
nocache
nocycle;


create table emp_seq2(
id number,
name varchar2(20),
day timestamp with time zone default systimestamp
);

select * 
from emp_seq2
where id=1000;

insert into emp_seq2 values(seq_test2.nextval, '백설',default);
insert into emp_seq2 values(seq_test2.nextval, '솜이',default);
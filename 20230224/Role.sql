-- 역할 생성
-- create role
-- 역할 삭제
-- drop role

-- 역할 생성
create role programmer;

--역할에 권한 부여
grant create table, create view, create procedure to programmer;

-- 역할에 권한 회수
revoke create any table, create any view, create any procedure from programmer;

-- 자신의 데이터베이스가 아닌 다른 데이터베이스에도 생성이 가능(예 : create table hr.sample)
grant create any table, create any view, create any procedure to programmer;

-- 역할을 분배
grant programmer to mdguest;

-- 접속되어 있는 모든 데이터 베이스에게 역할을 받을 수 있도록 활성화 시킴
set role all;

-- mdguest계정에서 테이블 생성
drop table soldesk.neworders;

create table soldesk.neworders(
myname varchar2(20),
myphone varchar2(20)
);
insert into soldesk.neworders values ('김둘리','010-5678-8956');


-- system계정에서 기능 추가
grant select, insert, update on soldesk.neworders to programmer;

-- mdguest
insert into soldesk.neworders values ('김둘리','010-5678-8956');

select * from soldesk.neworders;

select * from user_role_privs;

select * from dba_sys_privs;

select * from dba_sys_privs
where grantee='PROGRAMMER'; -- 대소문자구분 반드시 대문자

-- system
-- role 삭제
drop role programmer;

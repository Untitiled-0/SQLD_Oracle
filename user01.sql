-- 18C 버젼 관리자권한으로 실행 코드
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
/* HR  resource 가져오기
sqlplus에서 코드
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
@?/demo/schema/human_resources/hr_main.sql
specify password for HR as parameter 1:
Enter value for 1: hr
specify default tablespace for HR as parameter 2:
Enter value for 2: users
specify temporary tablespace for HR as parameter 3:
Enter value for 3: temp
specify log path as parameter 4:
Enter value for 4: $ORACLE_HOME/demo/schema/log/
*/

/*
관리자(system) 계정 삭제
select sid, serial#, username,status from v$session where username = 'SITEADMIN_DEV';
-- sid : 917,12242 
-- serial number : APEX_050000
alter system kill SESSION '917,12242';
alter session set "_oracle_script"=true;
drop user APEX_050000 cascade;

관리자(system,sys) 비밀번호 분실
sqlpus에서 코드
접속시 DBA로 접속
conn /as sysdba
비밀번호 변경
alter user system identfied by 12345;
*/

/*
 system에서 코드
 이미 생성된 계정 lock해제
 alter user scott account unlock;
 기존 계정 비밀번호 변경
 alter user scott identfied by 12345;
*/

/*일반 계정 생성
 계정 생성
 create user 계정명 IDENTIFIED by 비밀번호;
 계정 삭제
 drop user 삭제할 계정명;
*/

create user test identified by 12345;
grant connect, resource to test; --등록 권한 부여
grant create table, create view, create SEQUENCE to test;
alter user test default tablespace users quota unlimited on users; --물리적 공간
drop user test; --삭제


-- 데이터베이스(계정) 생성 soldesk(비밀번호는 12345)
create user soldesk identified by 12345;
-- system에서 접속 권한 부여
grant connect, resource to soldesk;
-- system에서 테이블 생성 view 생성, 인덱스 번호 생성 권한 부여
grant create table, create view, create SEQUENCE to soldesk;
-- 데이터 관리 권한 부여
grant insert, select, update, delete on department to soldesk;
-- 물리적인 공간 확보
ALTER USER soldesk DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- 과제 1

-- 데이터베이스(계정) 생성 madang(비밀번호는 12345)
CREATE USER madang IDENTIFIED BY 12345;
-- 접속 권한
GRANT CONNECT, RESOURCE TO madang;
-- 기본 테이블 생성 view 생성, 인덱스 번호 생성 권한 부여
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO madang;
-- 물리적인 공간 확보
ALTER USER madang DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- 데이터베이스(계정) 생성 guest(비밀번호는 12345)
CREATE USER guest IDENTIFIED BY 12345;
-- 접속 권한
GRANT CONNECT, RESOURCE TO guest;
-- 기본 테이블 생성 view 생성, 인덱스 번호 생성 권한 부여
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO guest;
-- 물리적인 공간 확보
ALTER USER guest DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- 데이터베이스(계정) 생성 member(비밀번호는 12345)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user member identified by 12345;
grant connect, resource to member;
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO member;
grant insert, select, update, delete on soldesk.memberjoin to member;

ALTER USER member DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;




















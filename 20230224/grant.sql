-- system계정에서 구현
alter session set "_ORACLE_SCRIPT"=true;
create user mdguest identified by mdguest;
grant connect, resource to mdguest;


-- 일반 계정비번 분실
alter user mdguest identified by mdguest;

-- system 계정 잠겨 있는경우
-- sql Plus
/*
사용자명 입력 : conn/as sysdba 또는 sys
비밀번호 입력 : enter
sql > alter user system account unlock;
*/

-- system 계정비번 분실
-- sql plus 접속
/*
사용자 입력 : conn/as sysdba 
비밀번호 : enter (그냥 엔터)
sql > alter user system identified by mdguest;
*/

-- madang계정에서 구현

-- book테이블의 select, update, insert, delete 권한을 mdguest에게 부여
grant select, update, insert, delete on book to member;

-- customer 테이블의 select, update, insert, delete, grant 권한을 mdguest에게 부여
-- with grant option 부여받은 권한을 양도할 수 있음 
grant select, update, insert, delete on customer to member with grant option;

--member에서 구현
grant select on madang.book to sales; -- error 권한 불충분

grant select on madang.customer to sales; -- 가능 

-- sales 계정에서 구현
select * from madang.book;

-- madang에서 구현
-- oracle에 있는 모든 데이터베이스 (사용자)에게 select 할 수 있도록 권한부여
grant select on orders to public;

-- revoke


select * from USER_TAB_PRIVS_MADE	
where grantee= 'madang';




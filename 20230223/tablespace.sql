-- tablespace : user 또는 database에 물리적인 저장공간
-- 기본 tablespace 설정
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
ALTER USER madang DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- tablespace 생성
create tablespace md_tbs datafile 'C:\madang\oracle\MD_TBS_DATA01.dbf' size 10M;
create tablespace md_test datafile 'C:\madang\oracle\md_test_data01.dbf' size 10M;

-- tablespace 삭제
drop tablespace md_tbs;
drop tablespace md_test;

-- tablespace 정보 출력
select tablespace_name, status, contents
from sys.dba_tablespaces;

-- tablespace 파일정보출력
select file_name, tablespace_name, bytes/1024/1024 MB
from sys.dba_data_files;

select *
from sys.dba_extents;

-- 신규 계정 등록시 tablespace
drop user sample;
create user sample identified by 12345 default tablespace md_test;

-- 기존 계정 등록시 사용자가 만든 tablespace 적용
alter user sales identified by 12345 default tablespace md_test;





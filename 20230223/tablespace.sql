-- tablespace : user �Ǵ� database�� �������� �������
-- �⺻ tablespace ����
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
ALTER USER madang DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- tablespace ����
create tablespace md_tbs datafile 'C:\madang\oracle\MD_TBS_DATA01.dbf' size 10M;
create tablespace md_test datafile 'C:\madang\oracle\md_test_data01.dbf' size 10M;

-- tablespace ����
drop tablespace md_tbs;
drop tablespace md_test;

-- tablespace ���� ���
select tablespace_name, status, contents
from sys.dba_tablespaces;

-- tablespace �����������
select file_name, tablespace_name, bytes/1024/1024 MB
from sys.dba_data_files;

select *
from sys.dba_extents;

-- �ű� ���� ��Ͻ� tablespace
drop user sample;
create user sample identified by 12345 default tablespace md_test;

-- ���� ���� ��Ͻ� ����ڰ� ���� tablespace ����
alter user sales identified by 12345 default tablespace md_test;





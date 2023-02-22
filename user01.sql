-- 18C ���� �����ڱ������� ���� �ڵ�
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
/* HR  resource ��������
sqlplus���� �ڵ�
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
������(system) ���� ����
select sid, serial#, username,status from v$session where username = 'SITEADMIN_DEV';
-- sid : 917,12242 
-- serial number : APEX_050000
alter system kill SESSION '917,12242';
alter session set "_oracle_script"=true;
drop user APEX_050000 cascade;

������(system,sys) ��й�ȣ �н�
sqlpus���� �ڵ�
���ӽ� DBA�� ����
conn /as sysdba
��й�ȣ ����
alter user system identfied by 12345;
*/

/*
 system���� �ڵ�
 �̹� ������ ���� lock����
 alter user scott account unlock;
 ���� ���� ��й�ȣ ����
 alter user scott identfied by 12345;
*/

/*�Ϲ� ���� ����
 ���� ����
 create user ������ IDENTIFIED by ��й�ȣ;
 ���� ����
 drop user ������ ������;
*/

create user test identified by 12345;
grant connect, resource to test; --��� ���� �ο�
grant create table, create view, create SEQUENCE to test;
alter user test default tablespace users quota unlimited on users; --������ ����
drop user test; --����


-- �����ͺ��̽�(����) ���� soldesk(��й�ȣ�� 12345)
create user soldesk identified by 12345;
-- system���� ���� ���� �ο�
grant connect, resource to soldesk;
-- system���� ���̺� ���� view ����, �ε��� ��ȣ ���� ���� �ο�
grant create table, create view, create SEQUENCE to soldesk;
-- ������ ���� ���� �ο�
grant insert, select, update, delete on department to soldesk;
-- �������� ���� Ȯ��
ALTER USER soldesk DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- ���� 1

-- �����ͺ��̽�(����) ���� madang(��й�ȣ�� 12345)
CREATE USER madang IDENTIFIED BY 12345;
-- ���� ����
GRANT CONNECT, RESOURCE TO madang;
-- �⺻ ���̺� ���� view ����, �ε��� ��ȣ ���� ���� �ο�
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO madang;
-- �������� ���� Ȯ��
ALTER USER madang DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- �����ͺ��̽�(����) ���� guest(��й�ȣ�� 12345)
CREATE USER guest IDENTIFIED BY 12345;
-- ���� ����
GRANT CONNECT, RESOURCE TO guest;
-- �⺻ ���̺� ���� view ����, �ε��� ��ȣ ���� ���� �ο�
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO guest;
-- �������� ���� Ȯ��
ALTER USER guest DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- �����ͺ��̽�(����) ���� member(��й�ȣ�� 12345)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user member identified by 12345;
grant connect, resource to member;
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO member;
grant insert, select, update, delete on soldesk.memberjoin to member;

ALTER USER member DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;




















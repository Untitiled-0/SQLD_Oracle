-- ���� ����
-- create role
-- ���� ����
-- drop role

-- ���� ����
create role programmer;

--���ҿ� ���� �ο�
grant create table, create view, create procedure to programmer;

-- ���ҿ� ���� ȸ��
revoke create any table, create any view, create any procedure from programmer;

-- �ڽ��� �����ͺ��̽��� �ƴ� �ٸ� �����ͺ��̽����� ������ ����(�� : create table hr.sample)
grant create any table, create any view, create any procedure to programmer;

-- ������ �й�
grant programmer to mdguest;

-- ���ӵǾ� �ִ� ��� ������ ���̽����� ������ ���� �� �ֵ��� Ȱ��ȭ ��Ŵ
set role all;

-- mdguest�������� ���̺� ����
drop table soldesk.neworders;

create table soldesk.neworders(
myname varchar2(20),
myphone varchar2(20)
);
insert into soldesk.neworders values ('��Ѹ�','010-5678-8956');


-- system�������� ��� �߰�
grant select, insert, update on soldesk.neworders to programmer;

-- mdguest
insert into soldesk.neworders values ('��Ѹ�','010-5678-8956');

select * from soldesk.neworders;

select * from user_role_privs;

select * from dba_sys_privs;

select * from dba_sys_privs
where grantee='PROGRAMMER'; -- ��ҹ��ڱ��� �ݵ�� �빮��

-- system
-- role ����
drop role programmer;

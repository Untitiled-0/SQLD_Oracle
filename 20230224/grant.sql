-- system�������� ����
alter session set "_ORACLE_SCRIPT"=true;
create user mdguest identified by mdguest;
grant connect, resource to mdguest;


-- �Ϲ� ������� �н�
alter user mdguest identified by mdguest;

-- system ���� ��� �ִ°��
-- sql Plus
/*
����ڸ� �Է� : conn/as sysdba �Ǵ� sys
��й�ȣ �Է� : enter
sql > alter user system account unlock;
*/

-- system ������� �н�
-- sql plus ����
/*
����� �Է� : conn/as sysdba 
��й�ȣ : enter (�׳� ����)
sql > alter user system identified by mdguest;
*/

-- madang�������� ����

-- book���̺��� select, update, insert, delete ������ mdguest���� �ο�
grant select, update, insert, delete on book to member;

-- customer ���̺��� select, update, insert, delete, grant ������ mdguest���� �ο�
-- with grant option �ο����� ������ �絵�� �� ���� 
grant select, update, insert, delete on customer to member with grant option;

--member���� ����
grant select on madang.book to sales; -- error ���� �����

grant select on madang.customer to sales; -- ���� 

-- sales �������� ����
select * from madang.book;

-- madang���� ����
-- oracle�� �ִ� ��� �����ͺ��̽� (�����)���� select �� �� �ֵ��� ���Ѻο�
grant select on orders to public;

-- revoke


select * from USER_TAB_PRIVS_MADE	
where grantee= 'madang';




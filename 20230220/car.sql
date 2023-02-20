-- �ڵ��� ������Ʈ
-- ��ǰ, �ڵ��� ȸ��, �ڵ���, ��ǰ_�ڵ���

--part_id
create table ��ǰ(
part_id varchar2(20),
part_name varchar(20),
year varchar(20)
);


-- �⺻Ű : com_id
create table �ڵ���ȸ��(
com_id varchar(20) , 
name varchar(20) , 
city varchar(20),
nation varchar(20));


-- �⺻Ű : name
create table �ڵ���(
name varchar(20), 
com_id varchar(20) , 
com_name varchar(20)
);

-- �⺻Ű : part_id, name
create table ��ǰ_�ڵ���(
part_id varchar(20), 
name varchar(20)

);

-- ��������
-- �⺻Ű
-- primary key ����
--alter table ��ǰ_�ڵ��� drop primary key;
-- alter table �ڵ���ȸ�� drop constraint �ڵ���ȸ��_pk;

alter table ��ǰ add primary key (part_id) ;
alter table �ڵ���ȸ�� add primary key (com_id) ;
alter table �ڵ��� add primary key (name) ;
alter table ��ǰ_�ڵ��� add primary key (part_id,name) ;



-- �������� (�ڵ���ȸ�� => �ڵ���)

alter table �ڵ��� add constraint �ڵ���_ȸ�� Foreign key (name) references �ڵ���ȸ��(com_id) on delete cascade;


-- ��ǰ, �ڵ��� => ��ǰ_�ڵ���

alter table ��ǰ_�ڵ��� add constraint ��ǰ_fk Foreign key (part_id) references ��ǰ(part_id) on delete cascade;
alter table ��ǰ_�ڵ��� add constraint �ڵ����̸�_fk Foreign key (name) references �ڵ���(name) on delete cascade;


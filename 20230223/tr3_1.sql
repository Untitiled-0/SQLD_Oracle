set transaction isolation
level read uncommitted;

-- �д� Ʈ�����
-- �⺻ ����Ŭ������ �ǽ� �Ұ���
-- step 1

create table users
(id number, name varchar2(20), age number);

insert into users values(1, 'hong gildong', 30); 


commit;

select * from users where id = 1;
select * from users;

drop table users;
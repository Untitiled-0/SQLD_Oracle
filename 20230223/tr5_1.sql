/* t1 �д� ������
repeatable read ��� �⺻ ����Ŭ���� ���� �ȵ�
�ӽ� �����Ͽ� �ǽ�
*/
commit;

set transaction isolation level read committed;

insert into users values(2, 'Bob', 27);


-- ���� ������ �б�
select * from users
where age BETWEEN 10 and 30;

----

select sum(price) from book;
commit;
set transaction isolation
level read uncommitted;

-- 읽는 트랜잭션
-- 기본 오라클에서는 실습 불가능
-- step 1

create table users
(id number, name varchar2(20), age number);

insert into users values(1, 'hong gildong', 30); 


commit;

select * from users where id = 1;
select * from users;

drop table users;
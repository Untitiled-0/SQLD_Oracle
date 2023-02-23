-- 쓰기 트랜잭션

commit;

set transaction isolation
level read committed;


-- step2
update madang.users
set age = 21
where id = 1;

select * from madang.users where id =1 ;

select * from madang.users;
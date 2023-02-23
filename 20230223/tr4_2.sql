set transaction isolation level
read committed;

-- step2

update madang.users
set age = 21
where id =1;

commit;

-- step4

select * from madang.users where id =1;
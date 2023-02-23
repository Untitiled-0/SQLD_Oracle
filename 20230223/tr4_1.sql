-- 반복불가능 읽기
set transaction isolation level
read committed;

-- step1
select * from users where id =1;


-- step3

select * from users where id =1;
-- t2 쓰기모드 
set transaction isolation level read committed;

insert into madang.users values(3, 'B', 21);
commit;


select * from madang.users
where age BETWEEN 10 and 30;

----
select sum(price) from madang.book;

update madang.book
set price = price +500
where bookid = 1;
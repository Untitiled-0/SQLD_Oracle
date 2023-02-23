-- system
set transaction name 'mytran';

delete madang.book where bookid=99;
insert into madang.book values(99,'데이터베이스','솔데스크',25000);

 -- 트랜잭션 1번
select bookname "bookname1"
from madang.book 
where bookid = 99;


-- commit을 해버리면 아래의 transaction 완료

savepoint a; -- 여기까지 a라고 저장

 -- 트랜잭션 2번
update madang.book
set bookname = '데이터베이스개론'
where bookid = 99;

savepoint b;



update madang.book
set bookname = '데이터베이스개론 및 실습'
where bookid = 99;

commit;

update madang.book
set bookname = '데이터베이스개론 및 실습2'
where bookid = 99;



rollback to a;
rollback;




select * from madang.book;




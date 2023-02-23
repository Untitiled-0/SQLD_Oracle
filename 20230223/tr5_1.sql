/* t1 읽는 데이터
repeatable read 모드 기본 오라클에서 제공 안됨
임시 수정하여 실습
*/
commit;

set transaction isolation level read committed;

insert into users values(2, 'Bob', 27);


-- 유령 데이터 읽기
select * from users
where age BETWEEN 10 and 30;

----

select sum(price) from book;
commit;
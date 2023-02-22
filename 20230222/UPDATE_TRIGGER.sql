-- madang
-- update triger

create table customer_UpDate_TR(
custid number,
name varchar2(20),
address varchar2(40),
phone varchar2(20));

drop trigger update_trigger;

create or replace trigger update_trigger
after update on customer for each row -- 트리거 생성

begin
    insert into customer_update_tr
    values(:old.custid, :old.name, :old.address, :old.phone); -- old : 에전데이터
    DBMS_OUTPUT.put_line('업데이트된 튜플을 customer_UpDate_TR 테이블에 백업 완료');
end;
/

update customer
set phone ='010-7777-5555'
where name = '김연아';

select * from customer_UpDate_TR;
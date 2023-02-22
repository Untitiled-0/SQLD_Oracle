

-- madang

SELECT * FROM CUSTOMER;

create table customer_log(
custid_l number,
custname_l varchar2(40),
address_l varchar2(40),
phone_l varchar2(40),
cusdate varchar2(40),
worked varchar2(40)
);

-- afterInsertCustomter
drop trigger afterInsertCustomer;
create or replace trigger afterInsertCustomer
after insert on customer for each row
begin
    insert into customer_log
    values(:new.custid,:new.name,:new.address,:new.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),
    'INSERT_TRIGGER');
    dbms_output.put_line('인서트 튜플을 customer_log 테이블에 백업완료');
end;
/

-- afterDeleteCustomer
drop trigger afterDeleteCustomer;
create or replace trigger afterDeleteCustomer
after delete on customer for each row
begin
    insert into customer_log 
    values(:old.custid,:old.name,:old.address,:old.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),
    'DELETE_TRIGGER');
    dbms_output.put_line('삭제 튜플을 customer_log 테이블에 백업완료');
end;
/


-- afterUpdateCustomer
drop trigger afterUpdateCustomer;
create or replace trigger afterUpdateCustomer
after update on customer for each row
begin
    insert into customer_log 
    values(:old.custid,:old.name,:old.address,:old.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),
    'UPDATE_TRIGGER');
    dbms_output.put_line('업데이트된 튜플을 customer_log 테이블에 백업완료');
end;
/


set serveroutput on;
insert into customer values(7,'송준','영국','010-9874-6532');

update customer
set phone ='010-6666-5555'
where name = '송준';

delete from customer where custid = 6;


drop table customer_log;
select * from customer_log;

-- inserting, updatingm deleting
-- AfterCRUDCustomer

/*

if inserting then

elsif updating then

elsif deleting then

end if


*/

create or replace trigger afterCRUDCustomer
after insert or update or delete on customer for each row
begin
     if inserting then
         insert into customer_log
        values(:new.custid,:new.name,:new.address,:new.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),
        'INSERT_TRIGGER');
        dbms_output.put_line('인서트 튜플을 customer_log 테이블에 백업완료');
    elsif updating  then 
        insert into customer_log 
        values(:old.custid,:old.name,:old.address,:old.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),
        'UPDATE_TRIGGER');
        dbms_output.put_line('업데이트된 튜플을 customer_log 테이블에 백업완료');
    elsif deleting  then
        insert into customer_log 
        values(:old.custid,:old.name,:old.address,:old.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),
        'DELETE_TRIGGER');
        dbms_output.put_line('삭제 튜플을 customer_log 테이블에 백업완료');
    end if;
end;
/






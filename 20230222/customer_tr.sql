

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
    dbms_output.put_line('�μ�Ʈ Ʃ���� customer_log ���̺� ����Ϸ�');
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
    dbms_output.put_line('���� Ʃ���� customer_log ���̺� ����Ϸ�');
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
    dbms_output.put_line('������Ʈ�� Ʃ���� customer_log ���̺� ����Ϸ�');
end;
/


set serveroutput on;
insert into customer values(7,'����','����','010-9874-6532');

update customer
set phone ='010-6666-5555'
where name = '����';

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
        dbms_output.put_line('�μ�Ʈ Ʃ���� customer_log ���̺� ����Ϸ�');
    elsif updating  then 
        insert into customer_log 
        values(:old.custid,:old.name,:old.address,:old.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),
        'UPDATE_TRIGGER');
        dbms_output.put_line('������Ʈ�� Ʃ���� customer_log ���̺� ����Ϸ�');
    elsif deleting  then
        insert into customer_log 
        values(:old.custid,:old.name,:old.address,:old.phone, to_char(sysdate,'yyyy-mm-dd HH:Mi:ss'),
        'DELETE_TRIGGER');
        dbms_output.put_line('���� Ʃ���� customer_log ���̺� ����Ϸ�');
    end if;
end;
/






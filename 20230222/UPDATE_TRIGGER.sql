-- madang
-- update triger

create table customer_UpDate_TR(
custid number,
name varchar2(20),
address varchar2(40),
phone varchar2(20));

drop trigger update_trigger;

create or replace trigger update_trigger
after update on customer for each row -- Ʈ���� ����

begin
    insert into customer_update_tr
    values(:old.custid, :old.name, :old.address, :old.phone); -- old : ����������
    DBMS_OUTPUT.put_line('������Ʈ�� Ʃ���� customer_UpDate_TR ���̺� ��� �Ϸ�');
end;
/

update customer
set phone ='010-7777-5555'
where name = '�迬��';

select * from customer_UpDate_TR;
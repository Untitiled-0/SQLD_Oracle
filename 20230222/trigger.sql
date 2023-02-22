-- madang
-- TRIGGER
CREATE TABLE Book_log(
    bookid_l NUMBER,
    bookname_l VARCHAR2(40),
    publisher_l VARCHAR2(40),
    price_l NUMBER);

select * from book_log;

----------------------------------
create or replace trigger AfterInsertBook
-- insert���� �̿��Ͽ� book���̺� Ʈ���� �ڵ� ����
after insert on book for each row
declare --��������
        average number;
begin
    -- book�� ���Ե� Ʈ���Ÿ� book_log�� �ڵ� ���
    insert into book_log 
    values (:new.bookid,:new.bookname,:new.publisher,:new.price);
    DBMS_OUTPUT.put_line('���� Ʃ���� book_log ���̺� ��� �Ϸ�');
end;
/

insert into book values(35,'�߱��� ��','�̻�̵��',27000);
select * from book where bookid = 35;
select * from book_log;
-- bookid�� 30�� ������ �����̸�, ������ ����

select * from book;

create or replace procedure UPDATE_PROC (
b_bookid number,
b_bookname varchar2,
b_publisher varchar2,
b_price int
)
as -- is �� ����
begin
        update book set price = b_price, bookname=b_bookname,
        publisher = b_publisher
        where bookid=b_bookid;
end;
/

exec UPDATE_PROC(30,'����������','�½�����',25000);


update book
set bookname = '���н�����',
        price = 30000
where bookid = 30;


------------------------------------------







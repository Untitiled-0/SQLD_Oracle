-- bookid가 30인 도서의 도서이름, 가격을 변경

select * from book;

create or replace procedure UPDATE_PROC (
b_bookid number,
b_bookname varchar2,
b_publisher varchar2,
b_price int
)
as -- is 도 가능
begin
        update book set price = b_price, bookname=b_bookname,
        publisher = b_publisher
        where bookid=b_bookid;
end;
/

exec UPDATE_PROC(30,'스포츠과학','굿스포츠',25000);


update book
set bookname = '과학스포츠',
        price = 30000
where bookid = 30;


------------------------------------------







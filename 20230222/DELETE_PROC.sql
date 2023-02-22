-- madang
select * from book;

create or replace PROCEDURE DELETE_BOOK(
d_bookid int
)
as
begin
    delete book
    where d_bookid like bookid;
end;
/

exec DELETE_BOOK(30);
----------------------------------
select * from customer;

create or replace PROCEDURE DELETE_CUSTOMER(
d_name varchar2
)
as
begin
    delete customer
    where d_name like name;
end;
/

exec DELETE_CUSTOMER('박세리');
insert into customer values(5,'박세리','서울시 노원구',NULL);
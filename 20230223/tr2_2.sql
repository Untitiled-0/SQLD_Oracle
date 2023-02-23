set transaction name 't2';

-- step 2

update madang.book
set price = price *1.1
where bookid =2;

-- step 4

update madang.book
set price = price * 1.1
where bookid =1;


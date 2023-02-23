set transaction name 't1';

-- step 1

update book
set price = price + 100
where bookid =1;

-- step 3

update book
set price = price + 100
where bookid =2;

commit;
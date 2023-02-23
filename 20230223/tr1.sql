alter session set "_ORACLE_SCRIPT"=true;
set transaction name 't1';
commit;
--step1

select * from book where bookid =1;

update book
set price = 7100
where bookid  = 1;

savepoint a;

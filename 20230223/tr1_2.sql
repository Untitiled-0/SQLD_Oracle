alter session set "_ORACLE_SCRIPT"=true;
set transaction name 't2';
commit;
---

select * from madang.book where bookid=1;

update madang.book set price = price +100
where bookid=1;
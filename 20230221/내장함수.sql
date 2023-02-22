-- 수학함수


-- ABS(절대값)
select abs(-88), abs(88)
from dual;

-- ROUND
select ROUND (4.7851,1)
from dual;

select custid "고객 번호", sum(saleprice)/count(*) "총 판매액"
from orders
group by custid;


select * from employees;

order by employees_id;



-- 문자함수
select * from book;
select bookid, replace(bookname, '야구', '농구') bookname, publisher
from book;

select bookname "제목", length(bookname) "글자 수", lengthb(bookname) "바이트수"
from book
where publisher='굿스포츠';

select substr(name, 1,1)"성",count(*) "인원"
from customer
group by substr(name, 1, 1);



-- 날짜함수
-- to_date : 문자형으로 지정된 날짜를 -> 날짜형으로 타입 변경
-- to_char : 날짜형으로 저장된 날짜를 -> 문자형으로 타입 변경


select *
from orders;

select orderid, orderdate "주문일", orderdate+14 "배송완료"
from orders;

select orderid, to_char(orderdate, 'mm-dd dy') "주문일", custid, bookid
from orders
where orderdate=to_date('20140708','yyyymmdd');

select add_MONTHS(to_date('2014-07-07','yyyy-mm-dd'),3) "주문일"
from dual;

select last_day(to_date('2023-07-07','yyyy-mm-dd')) "주문일"
from dual;

select systimestamp from dual;

select sysdate from dual;

select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh12:mi:ss') "systime" from dual;

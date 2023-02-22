-- Function
-- madang 계정

drop function fnc_interest;
create or replace function fnc_Interest(
price number
) return int
is
myInterest number;
begin
-- 가격이 15000원 이상이면 10프로 그렇지 않으면 5프로 이익
    if price>=15000 then
    myInterest := price * 0.1;
    else
    myInterest := price * 0.05;
 end if;
 return myInterest;
end;
/

select custid, orderid, saleprice, fnc_Interest(saleprice) as "interest"
from orders;


--------------------hr 계정
-- fun_interested( salary 가 20000dlaus 5프로 그밖에 3프로 )
select * from employees;

drop function fnc_interested;
create or replace function fnc_Interested(
price number
) return int
is
myInterest number;
begin
    if salary>=20000 then
    myInterest := myInterest * 0.05;
    else
    myInterest := myInterest * 0.03;
 end if;
 return myInterest;
end;
/

--select custid, orderid, saleprice, fnc_Interest(saleprice) as "interest"
--from orders;


select employee_Id, First_name ||' '||last_name, Job_ID, salary, 
fnc_Interested(salary) "급여인상금" 
from employees;


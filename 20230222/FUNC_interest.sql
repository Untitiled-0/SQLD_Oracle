-- Function
-- madang ����

drop function fnc_interest;
create or replace function fnc_Interest(
price number
) return int
is
myInterest number;
begin
-- ������ 15000�� �̻��̸� 10���� �׷��� ������ 5���� ����
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


--------------------hr ����
-- fun_interested( salary �� 20000dlaus 5���� �׹ۿ� 3���� )
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
fnc_Interested(salary) "�޿��λ��" 
from employees;


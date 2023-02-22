-- PROCEDURE
create or replace procedure insertbook(
mybookid in number, -- in �Է¿�
mybookname in varchar2,
mypublisher in varchar2,
myprice in number)
as
begin
insert into book(bookid, bookname, publisher, price) 
values(mybookid, mybookname, mypublisher, myprice);
end;
/

exec insertbook(30, '����������', '�ֵ���ũ����', 25000);

select * from book;

----------------------------------------
create or replace procedure bookinsertorupdate(
mybookid number,
mybookname varchar2,
mypublisher varchar2,
myprice int) 
as
    mycount number; -- begin���� ����ϴ� ������ ������ �������ش�.
begin
    select count(*) into mycount from book  --count(*) �� ������� mycount�� �ִ´�
    where bookname like mybookname;
    if mycount != 0 then 
        update book set price = myprice 
        where bookname like mybookname;
    else 
        insert into book(bookid, bookname, publisher, price) 
        values(mybookid, mybookname, mypublisher, myprice);
    end if;
end;
/
exec bookinsertorupdate(30, '����������', '�ֵ���ũ����', 28000);
exec bookinsertorupdate(31, '�������� ��ſ�', '�ֵ���ũ����', 20000);


------------------------------------------

create or replace procedure averageprice(
averageval out number -- out�� ��¿� �Ű�����
)
as

begin
    select avg(price) into averageval
    from book
    where price is not null;
end;
/

-- DBMS_output.put_line�� ���� ��¿��� ����
set SERVEROUTPUT on;
declare 
averageval number;
begin
averageprice(averageval); -- double averageval = averageprice(avgprice);
DBMS_output.put_line('�������� ��� : ' || round(averageval,3));
end;
/

------------------------------------
-- orders���� �Ǹŵ����� ���� �����ͱ� ����ϴ� ���ν���

create or replace procedure interest
as
 myInterest numeric; -- ��������
 price numeric;
 cursor InterestCursor is select saleprice from orders;
begin
    myInterest :=0.0;
    open InterestCursor; -- Ŀ�� ����� �˸�
    loop
        fetch InterestCursor into price; -- ���� Ʃ���� ���� �������� fatch
        exit when InterestCursor%notfound;
        if price >= 15000 then
           myInterest := myInterest+price*0.1;
        else
           myInterest := myInterest+price*0.05;
        end if;
    end loop;
    close InterestCursor; -- Ŀ�� ����
    DBMS_output.put_line('��ü ���� �ݾ� = ' || myInterest); -- ����� ����Ͽ� return
end;
/

----
set serveroutput on;
exec interest;


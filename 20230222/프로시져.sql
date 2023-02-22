-- PROCEDURE
create or replace procedure insertbook(
mybookid in number, -- in 입력용
mybookname in varchar2,
mypublisher in varchar2,
myprice in number)
as
begin
insert into book(bookid, bookname, publisher, price) 
values(mybookid, mybookname, mypublisher, myprice);
end;
/

exec insertbook(30, '스포츠과학', '솔데스크서적', 25000);

select * from book;

----------------------------------------
create or replace procedure bookinsertorupdate(
mybookid number,
mybookname varchar2,
mypublisher varchar2,
myprice int) 
as
    mycount number; -- begin에서 사용하는 변수를 위에서 선언해준다.
begin
    select count(*) into mycount from book  --count(*) 의 결과값을 mycount에 넣는다
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
exec bookinsertorupdate(30, '스포츠과학', '솔데스크서적', 28000);
exec bookinsertorupdate(31, '스포츠의 즐거움', '솔데스크서적', 20000);


------------------------------------------

create or replace procedure averageprice(
averageval out number -- out은 출력용 매개변수
)
as

begin
    select avg(price) into averageval
    from book
    where price is not null;
end;
/

-- DBMS_output.put_line에 의한 출력여부 설정
set SERVEROUTPUT on;
declare 
averageval number;
begin
averageprice(averageval); -- double averageval = averageprice(avgprice);
DBMS_output.put_line('도서가격 평균 : ' || round(averageval,3));
end;
/

------------------------------------
-- orders에서 판매도서에 대한 순이익금 계산하는 프로시져

create or replace procedure interest
as
 myInterest numeric; -- 지역변수
 price numeric;
 cursor InterestCursor is select saleprice from orders;
begin
    myInterest :=0.0;
    open InterestCursor; -- 커서 사용을 알림
    loop
        fetch InterestCursor into price; -- 다음 튜플의 값을 가져오는 fatch
        exit when InterestCursor%notfound;
        if price >= 15000 then
           myInterest := myInterest+price*0.1;
        else
           myInterest := myInterest+price*0.05;
        end if;
    end loop;
    close InterestCursor; -- 커서 종료
    DBMS_output.put_line('전체 이익 금액 = ' || myInterest); -- 결과값 출력하여 return
end;
/

----
set serveroutput on;
exec interest;


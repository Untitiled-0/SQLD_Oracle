-- 부속질의 (스칼라질의)



-- 구매한 고객의 모든 정보를 보이시오
-- ansi
-- oracle


select * 
from customer cs, orders od
where cs.custid = od.custid;

select * 
from customer cs
inner join orders od on cs.custid = od.custid;

-- 고객별 판매액을 검색하여 해당 고객의 이름(customer)과 총 판매액 (orders)을 보이시오

select name, sum(saleprice)
from customer cs, orders od
where cs.custid = od.custid
group by cs.name;

select name, sum(saleprice)
from customer cs
inner join orders od on cs.custid = od.custid
group by cs.name
order by name;

-- 스칼라 질의
select od.custid, (select name 
                            from customer cs
                            where cs.custid = od.custid) as name, sum(saleprice) -- as? asliase?
from orders od
group by od.custid
order by custid;

-- 고객의 id가 2번 이하의 고객에 대한 이름과 총 판매액
-- 조인
select name, sum(saleprice)
from customer cs, orders od
where cs.custid = od.custid and cs. custid <= 2
GROUP by cs.name;

-- 스칼라 질의

select od.custid, (select name from customer cs
                        where cs.custid = od.custid and cs.custid <=2 ) as name, sum(saleprice)

from orders od
GROUP by od.custid
order by custid;


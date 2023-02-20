-- �μ����� (��Į������)



-- ������ ���� ��� ������ ���̽ÿ�
-- ansi
-- oracle


select * 
from customer cs, orders od
where cs.custid = od.custid;

select * 
from customer cs
inner join orders od on cs.custid = od.custid;

-- ���� �Ǹž��� �˻��Ͽ� �ش� ���� �̸�(customer)�� �� �Ǹž� (orders)�� ���̽ÿ�

select name, sum(saleprice)
from customer cs, orders od
where cs.custid = od.custid
group by cs.name;

select name, sum(saleprice)
from customer cs
inner join orders od on cs.custid = od.custid
group by cs.name
order by name;

-- ��Į�� ����
select od.custid, (select name 
                            from customer cs
                            where cs.custid = od.custid) as name, sum(saleprice) -- as? asliase?
from orders od
group by od.custid
order by custid;

-- ���� id�� 2�� ������ ���� ���� �̸��� �� �Ǹž�
-- ����
select name, sum(saleprice)
from customer cs, orders od
where cs.custid = od.custid and cs. custid <= 2
GROUP by cs.name;

-- ��Į�� ����

select od.custid, (select name from customer cs
                        where cs.custid = od.custid) as name, sum(saleprice) total

from orders od
where  od.custid <=2 
GROUP by od.custid;


-- �ֹ� ������ �ִ� �� ���̵�
select od.custid,(select cs.address from customer cs
                        where od.custid = cs.custid) as address, sum(saleprice) total
from orders od
group by od.custid;

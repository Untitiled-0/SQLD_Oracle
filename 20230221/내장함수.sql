-- �����Լ�


-- ABS(���밪)
select abs(-88), abs(88)
from dual;

-- ROUND
select ROUND (4.7851,1)
from dual;

select custid "�� ��ȣ", sum(saleprice)/count(*) "�� �Ǹž�"
from orders
group by custid;


select * from employees;

order by employees_id;



-- �����Լ�
select * from book;
select bookid, replace(bookname, '�߱�', '��') bookname, publisher
from book;

select bookname "����", length(bookname) "���� ��", lengthb(bookname) "����Ʈ��"
from book
where publisher='�½�����';

select substr(name, 1,1)"��",count(*) "�ο�"
from customer
group by substr(name, 1, 1);



-- ��¥�Լ�
-- to_date : ���������� ������ ��¥�� -> ��¥������ Ÿ�� ����
-- to_char : ��¥������ ����� ��¥�� -> ���������� Ÿ�� ����


select *
from orders;

select orderid, orderdate "�ֹ���", orderdate+14 "��ۿϷ�"
from orders;

select orderid, to_char(orderdate, 'mm-dd dy') "�ֹ���", custid, bookid
from orders
where orderdate=to_date('20140708','yyyymmdd');

select add_MONTHS(to_date('2014-07-07','yyyy-mm-dd'),3) "�ֹ���"
from dual;

select last_day(to_date('2023-07-07','yyyy-mm-dd')) "�ֹ���"
from dual;

select systimestamp from dual;

select sysdate from dual;

select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh12:mi:ss') "systime" from dual;

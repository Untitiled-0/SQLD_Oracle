-- system
set transaction name 'mytran';

delete madang.book where bookid=99;
insert into madang.book values(99,'�����ͺ��̽�','�ֵ���ũ',25000);

 -- Ʈ����� 1��
select bookname "bookname1"
from madang.book 
where bookid = 99;


-- commit�� �ع����� �Ʒ��� transaction �Ϸ�

savepoint a; -- ������� a��� ����

 -- Ʈ����� 2��
update madang.book
set bookname = '�����ͺ��̽�����'
where bookid = 99;

savepoint b;



update madang.book
set bookname = '�����ͺ��̽����� �� �ǽ�'
where bookid = 99;

commit;

update madang.book
set bookname = '�����ͺ��̽����� �� �ǽ�2'
where bookid = 99;



rollback to a;
rollback;




select * from madang.book;




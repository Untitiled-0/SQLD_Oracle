/*
start with : �������� ���۰�(�������� ������ 1���� ����)
increment by : ������
minvalue 1 : �Ӱ豸���� �ּҰ�
maxvalue 9999 : �Ӱ豸���� �ִ밪
cycle : 9999���� ��� �ٽ� 1���� �ݺ� 
nocycle : �ݺ�����
cache : ������ ����ߴ� �޸𸮰� ������
nocache : �ӵ����
*/
-- �⺻ ������
create SEQUENCE Update_sequence
  INCREMENT BY 1 MAXVALUE 5000 CYCLE;

-- ���� ������
drop SEQUENCE seq_test;

create SEQUENCE seq_test
start with 1
increment by 1
minvalue 1
maxvalue 9999
cycle nocache
;
/*
timestamp : date Ÿ���� Ȯ��(year, month, day, hour, minute, second)
with time zone : GMT ǥ�رⰣ�� �������� ���� ����
default systimestamp : �����ͺ��̽��� �����ϴ� �ý��� �ð��� ����
*/
create table emp_seq(
id number,
name varchar2(20),
day timestamp with time zone default systimestamp
);

select * from emp_seq;

insert into emp_seq values(seq_test.nextval, '�����',default);
insert into emp_seq values(seq_test.nextval, '�ڼ�',default);
insert into emp_seq values(seq_test.nextval, '�̹�ȯ',default);

------------------------------------------------------------------
-- ���� ������
create SEQUENCE seq_test2
start with 1000
increment by -1
minvalue 1
maxvalue 1000
nocache
nocycle;


create table emp_seq2(
id number,
name varchar2(20),
day timestamp with time zone default systimestamp
);

select * 
from emp_seq2
where id=1000;

insert into emp_seq2 values(seq_test2.nextval, '�鼳',default);
insert into emp_seq2 values(seq_test2.nextval, '����',default);
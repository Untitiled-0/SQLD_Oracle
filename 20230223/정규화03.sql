-- ����ȭ �ǽ� 
drop table �����ֹ�;
create table �����ֹ�(
�ֹ���ȣ number(30) primary key,
�ֹ���¥ date,
ȸ���̸� varchar(20),
ȸ����ȣ varchar(10),
ȸ���ּ� varchar(40),
��ȭ��ȣ varchar(20),
����_SNO number(30),
������ varchar(40),
���� number(30),
�ܰ� number(30)
);

create table �ֹ�����(
�ֹ���ȣ number(30) primary key,
�ֹ���¥ date,
ȸ����ȣ varchar(10),
����_SNO number(30),
FOREIGN KEY (ȸ����ȣ)  REFERENCES  ȸ��(ȸ����ȣ),
FOREIGN KEY (����_SNO)  REFERENCES  ��������(����_SNO)
);

create table ��������(
����_SNO number(30),
������ varchar(30),
���� number(30),
�ܰ� number(30)
);

create table ȸ��(
ȸ���̸� varchar(20),
ȸ����ȣ varchar(10),
ȸ���ּ� varchar(40),
��ȭ��ȣ varchar(20)
);

--ALTER TABLE �ֹ����� FOREIGN KEY(ȸ����ȣ) REFERENCES ȸ��(ȸ����ȣ);
--ALTER TABLE �ֹ����� FOREIGN KEY(����_SNO) REFERENCES ��������(����_SNO);


-- �� 3 ����ȭ
/*
CREATE TABLE ȸ�����̺�(
	ȸ����ȣ VARCHAR2(10) PRIMARY KEY,
	ȸ���̸� VARCHAR2(10),
	ȸ���ּ� VARCHAR2(40),
	��ȭ��ȣ VARCHAR2(20)
);

CREATE TABLE �ֹ��������̺�(
	�ֹ���ȣ NUMBER(30) PRIMARY KEY,
	�ֹ���¥ DATE,
	ȸ����ȣ VARCHAR2(10),
	����_SNO NUMBER(30)
);

CREATE TABLE �����������̺�(
	����_SNO NUMBER(30) PRIMARY KEY,
	������ VARCHAR2(30),
	���� NUMBER(30),
	�ܰ� NUMBER(30)
);

ALTER TABLE �ֹ��������̺� FOREIGN KEY(ȸ����ȣ) REFERENCES ȸ�����̺�(ȸ����ȣ);
ALTER TABLE �ֹ��������̺� FOREIGN KEY(����_SNO) REFERENCES �����������̺�(����_SNO);
*/



select * from �����ֹ�;

insert into �����ֹ� values(20190213123,to_date('2019-02-13','yyyy-mm-dd'),'lee','L-123','���� ������','010-3664-1234',9788123,'NoSQL�� ������ ������',1,25000);
insert into �����ֹ� values(20190509238,to_date('2019-05-09','yyyy-mm-dd'),'park','P-234','���� ������','010-5301-3456',97889234,'�����ͺ��̽� ���а� �ǽ�',1,27000);
insert into �����ֹ� values(20190509239,to_date('2019-05-09','yyyy-mm-dd'),'Park','P-234','���� ������','010-5301-3456',97889234,'JAVA for Beginner',2,18000);
insert into �����ֹ� values(20190721376,to_date('2019-07-21','yyyy-mm-dd'),'Kim','K-345','��⵵ ����','010-7341-2345',97889345,'�������� ���а� �ǽ�',5,24000);
insert into �����ֹ� values(20190729401,to_date('2019-07-29','yyyy-mm-dd'),'Nam','n-456','������ ����','010-9279-3456',97889234,'�����ͺ��̽� ���а� �ǽ�',1,27000);
insert into �����ֹ� values(20191005456,to_date('2019-10-05','yyyy-mm-dd'),'Park','P-234','���� ������','010-5301-3456',97889567,'����Ŭ ���α׷���',4,27000);









-- ȯ�ڹ�ȣ, ȯ���̸�, �����̸�, ���ǹ�ȣ
-- ó��, �����, ���̸�, ���ȣ, �뷮, ������,������

-- ȯ�� : ȯ�ڹ�ȣ(P), ȯ���̸�,  ������ȣ, ���ǹ�ȣ

-- ���� :  ������ȣ(P), ���ǹ�ȣ, ȯ�ڹ�ȣ(F)

-- �� : ���ȣ(P), ���̸�, ó��, �뷮, �����

-- ó�� : ȯ�ڹ�ȣ(P), ���ȣ(F), ������, ������










-- ������ Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   ��ġ:        2023-02-21 10:48:58 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g


-- �θ� ���̺��� �������� �����ϰ� ������
drop table ���� cascade constraints;
drop table �� cascade constraints;
drop table �󿵰� cascade constraints;
drop table ���� cascade constraints;



CREATE TABLE �� (
    ����ȣ NUMBER(10) NOT NULL,
    �̸�   VARCHAR2(20),
    �ּ�   VARCHAR2(40)
);

ALTER TABLE �� ADD CONSTRAINT ��_pk PRIMARY KEY ( ����ȣ );

CREATE TABLE ���� (
    �����ȣ NUMBER(20) NOT NULL,
    �����̸� VARCHAR2(20),
    ��ġ   VARCHAR2(20)
);

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( �����ȣ );

CREATE TABLE �󿵰� (
    �󿵰���ȣ NUMBER(10) NOT NULL,
    �����ȣ  NUMBER(10) NOT NULL,
    ��ȭ����  VARCHAR2(20),
    ����    NUMBER(20),
    �¼���   NUMBER(20)
);

ALTER TABLE �󿵰� ADD CONSTRAINT �󿵰�_pk PRIMARY KEY ( �󿵰���ȣ );

CREATE TABLE ���� (
    �¼���ȣ  NUMBER(10) NOT NULL,
    �󿵰���ȣ NUMBER(10) NOT NULL,
    ����ȣ  NUMBER(10) NOT NULL,
    ��¥    DATE
);

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( �¼���ȣ );

ALTER TABLE �󿵰�
    ADD CONSTRAINT �󿵰�_����_fk FOREIGN KEY ( �����ȣ )
        REFERENCES ���� ( �����ȣ );

ALTER TABLE ����
    ADD CONSTRAINT ����_��_fk FOREIGN KEY ( ����ȣ )
        REFERENCES �� ( ����ȣ );

ALTER TABLE ����
    ADD CONSTRAINT ����_�󿵰�_fk FOREIGN KEY ( �󿵰���ȣ )
        REFERENCES �󿵰� ( �󿵰���ȣ );




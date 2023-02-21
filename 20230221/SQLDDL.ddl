-- ������ Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   ��ġ:        2023-02-21 09:56:36 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ���� (
    ���¹�ȣ   NUMBER(8) NOT NULL,
    ���¸�    VARCHAR2(20),
    �������   VARCHAR2(20),
    ��米����ȣ VARCHAR2(20),
    ���ǽð�   VARCHAR2(20),
    ���ǽ�    VARCHAR2(20)
);

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( ���¹�ȣ );

CREATE TABLE ���� (
    ������ȣ    NVARCHAR2(1) NOT NULL,
    �а���ȣ    NUMBER(8),
    ���¹�ȣ    NUMBER(8),
    �ֹι�ȣ    VARCHAR2(20),
    �ּ�      VARCHAR2(20),
    �����̸�    VARCHAR2(20),
    ��ȭ��ȣ    VARCHAR2(20),
    �̸���     VARCHAR2(20),
    ����      VARCHAR2(20),
    ����_���¹�ȣ NUMBER(8) NOT NULL,
    �а�_�а���ȣ NUMBER(8) NOT NULL
);

ALTER TABLE ���� ADD CONSTRAINT ����_pk PRIMARY KEY ( ������ȣ );

CREATE TABLE �������� (
    �����ڵ�    NUMBER(8) NOT NULL,
    ���¹�ȣ    NUMBER(8),
    �л���ȣ    NUMBER(8),
    ������ȣ    NUMBER(8),
    �а���ȣ    NUMBER(8),
    ����      VARCHAR2(20),
    ����_���¹�ȣ NUMBER(8) NOT NULL,
    �л�_�л���ȣ NUMBER(8) NOT NULL,
    �л�_������ȣ NUMBER(8) NOT NULL,
    �л�_�а���ȣ NUMBER(8) NOT NULL,
    �л�_���¹�ȣ NUMBER(8) NOT NULL
);

ALTER TABLE �������� ADD CONSTRAINT ��������_pk PRIMARY KEY ( �����ڵ� );

CREATE TABLE �а� (
    �а���ȣ NUMBER(8) NOT NULL,
    �а���  VARCHAR2(20),
    ��ȭ��ȣ VARCHAR2(20)
);

ALTER TABLE �а� ADD CONSTRAINT �а�_pk PRIMARY KEY ( �а���ȣ );

CREATE TABLE �л� (
    �л���ȣ    NUMBER(8) NOT NULL,
    ������ȣ    NUMBER(10),
    �а���ȣ    NUMBER(8),
    ���¹�ȣ    NUMBER(8),
    �л��̸�    VARCHAR2(20),
    �ֹι�ȣ    VARCHAR2(20),
    "�г�/�б�" VARCHAR2(20),
    �ּ�      VARCHAR2(20),
    ��ȭ��ȣ    VARCHAR2(20),
    �̸���     VARCHAR2(20),
    ����      VARCHAR2(20),
    �а�_�а���ȣ NUMBER(8) NOT NULL,
    ����_������ȣ NVARCHAR2(1) NOT NULL
);

ALTER TABLE �л� ADD CONSTRAINT �л�_pk PRIMARY KEY ( �л���ȣ );

ALTER TABLE ����
    ADD CONSTRAINT ����_����_fk FOREIGN KEY ( ����_���¹�ȣ )
        REFERENCES ���� ( ���¹�ȣ );

ALTER TABLE ����
    ADD CONSTRAINT ����_�а�_fk FOREIGN KEY ( �а�_�а���ȣ )
        REFERENCES �а� ( �а���ȣ );

ALTER TABLE ��������
    ADD CONSTRAINT ��������_����_fk FOREIGN KEY ( ����_���¹�ȣ )
        REFERENCES ���� ( ���¹�ȣ );

ALTER TABLE ��������
    ADD CONSTRAINT ��������_�л�_fk FOREIGN KEY ( �л�_�л���ȣ )
        REFERENCES �л� ( �л���ȣ );

ALTER TABLE �л�
    ADD CONSTRAINT �л�_����_fk FOREIGN KEY ( ����_������ȣ )
        REFERENCES ���� ( ������ȣ );

ALTER TABLE �л�
    ADD CONSTRAINT �л�_�а�_fk FOREIGN KEY ( �а�_�а���ȣ )
        REFERENCES �а� ( �а���ȣ );




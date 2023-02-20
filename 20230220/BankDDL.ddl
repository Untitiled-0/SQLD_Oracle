-- ������ Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   ��ġ:        2023-02-20 16:17:20 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ���ݰ��� (
    ���ݰ���id NUMBER(8) NOT NULL,
    �ֹι�ȣ   VARCHAR2(20),
    ���ݰ������� VARCHAR2(20),
    �����ܰ�   VARCHAR2(20),
    ī���û���� CHAR(1),
    ���ݰ�����  DATE,
    �������̸�  VARCHAR2(20),
    ��ȭ��ȣ   VARCHAR2(20),
    �̸���    VARCHAR2(20)
);

ALTER TABLE ���ݰ��� ADD CONSTRAINT ���ݰ���_pk PRIMARY KEY ( ���ݰ���id );

CREATE TABLE ���ݰ���_�ŷ����� (
    ���ݰ���id      NUMBER(8) NOT NULL,
    ����ݳ�¥       DATE,
    �ŷ���ȣ        NUMBER(8),
    ���ݱ���        VARCHAR2(20),
    ���ݳ���        VARCHAR2(20),
    �ŷ��ݾ�        NUMBER(20),
    �����ܰ�        NUMBER(20),
    ���ݰ���_���ݰ���id NUMBER(8) NOT NULL
);

ALTER TABLE ���ݰ���_�ŷ����� ADD CONSTRAINT ���ݰ���_�ŷ�����_pk PRIMARY KEY ( ���ݰ���id );

ALTER TABLE ���ݰ���_�ŷ�����
    ADD CONSTRAINT ���ݰ���_�ŷ�����_���ݰ���_fk FOREIGN KEY ( ���ݰ���_���ݰ���id )
        REFERENCES ���ݰ��� ( ���ݰ���id );




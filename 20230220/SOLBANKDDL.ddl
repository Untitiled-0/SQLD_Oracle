-- ������ Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   ��ġ:        2023-02-20 17:06:30 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE �� (
    ���ֹι�ȣ VARCHAR2(20) NOT NULL,
    ����    VARCHAR2(20),
    ��������� VARCHAR2(20),
    ���̸���  VARCHAR2(20),
    ����ȭ��ȣ VARCHAR2(20),
    ������   VARCHAR2(20)
);

ALTER TABLE �� ADD CONSTRAINT ��_pk PRIMARY KEY ( ���ֹι�ȣ );

CREATE TABLE ���ݰ��� (
    ���ݰ���id    NUMBER(8) NOT NULL,
    ���ݰ�������    VARCHAR2(20),
    �����ܰ�      NUMBER(20),
    ī���û����    CHAR(1),
    ���ݰ�����     VARCHAR2(20),
    �������̸�     VARCHAR2(20),
    ��ȭ��ȣ      VARCHAR2(20),
    �̸���       VARCHAR2(20),
    ���ֹι�ȣ    VARCHAR2(20),
    ��_���ֹι�ȣ VARCHAR2(20) NOT NULL
);

ALTER TABLE ���ݰ��� ADD CONSTRAINT ���ݰ���_pk PRIMARY KEY ( ���ݰ���id );

CREATE TABLE ���ݰ��°ŷ����� (
    ���ݰ���id      NUMBER(8) NOT NULL,
    ����ݳ�¥       DATE,
    �ŷ���ȣ        VARCHAR2(20),
    ���ݱ���        VARCHAR2(20),
    ���ݳ���        VARCHAR2(20),
    �ŷ��ݾ�        NUMBER(20),
    �����ܰ�        NUMBER(20),
    ���ݰ���_���ݰ���id NUMBER(8) NOT NULL
);

ALTER TABLE ���ݰ��°ŷ����� ADD CONSTRAINT ���ݰ��°ŷ�����_pk PRIMARY KEY ( ���ݰ���id );

CREATE TABLE ī�� (
    ī��id        NUMBER(8) NOT NULL,
    ī���û����      VARCHAR2(20),
    ī���ѵ��ݾ�      NUMBER(10),
    ī���������      VARCHAR2(20),
    ī������        VARCHAR2(20),
    ���ֹι�ȣ      VARCHAR2(20),
    ���ݰ���id      VARCHAR2(20),
    ��_���ֹι�ȣ   VARCHAR2(20) NOT NULL,
    ���ݰ���_���ݰ���id NUMBER(8) NOT NULL
);

ALTER TABLE ī�� ADD CONSTRAINT ī��_pk PRIMARY KEY ( ī��id );

ALTER TABLE ���ݰ���
    ADD CONSTRAINT ���ݰ���_��_fk FOREIGN KEY ( ��_���ֹι�ȣ )
        REFERENCES �� ( ���ֹι�ȣ );

ALTER TABLE ���ݰ��°ŷ�����
    ADD CONSTRAINT ���ݰ��°ŷ�����_���ݰ���_fk FOREIGN KEY ( ���ݰ���_���ݰ���id )
        REFERENCES ���ݰ��� ( ���ݰ���id );

ALTER TABLE ī��
    ADD CONSTRAINT ī��_��_fk FOREIGN KEY ( ��_���ֹι�ȣ )
        REFERENCES �� ( ���ֹι�ȣ );

ALTER TABLE ī��
    ADD CONSTRAINT ī��_���ݰ���_fk FOREIGN KEY ( ���ݰ���_���ݰ���id )
        REFERENCES ���ݰ��� ( ���ݰ���id );




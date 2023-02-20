/*
create table order_2(
orderid number,
custname VARCHAR(20),
salesperson VARCHAR(20),
amount number,
PRIMARY key (orderid)
);
CREATE TABLE customer_2 (
    name       VARCHAR(20),
    city       VARCHAR(20),
    industytye VARCHAR(20)
);

*/

-- alter �������� 
-- ���Ժκ�

DROP TABLE customer_2;

CREATE TABLE customer_2 (
    name       VARCHAR(20) PRIMARY KEY,
    city       VARCHAR(20),
    industytye VARCHAR(20)
);

DROP TABLE order_2;

CREATE TABLE order_2 (
    orderid     NUMBER,
    custname    VARCHAR(20),
    salesperson VARCHAR(20),
    amount      NUMBER,
    FOREIGN KEY ( custname )
        REFERENCES customer_2
            ON DELETE CASCADE,
    FOREIGN KEY ( salesperson )
        REFERENCES salesperson ( name )
            ON DELETE CASCADE
);

DROP TABLE salesperson;

CREATE TABLE salesperson (
    name   VARCHAR(20),
    age    NUMBER,
    salary NUMBER
);

-- �⺻Ű orderid, name, name
ALTER TABLE order_2 ADD PRIMARY KEY ( orderid );

ALTER TABLE customer_2 ADD PRIMARY KEY ( name );

ALTER TABLE salesperson ADD PRIMARY KEY ( name );

-- not null : custname, city, salary
-- modift ����
ALTER TABLE order_2 MODIFY
    custname VARCHAR2(20) NOT NULL;

ALTER TABLE customer_2 MODIFY
    city VARCHAR2(20) NOT NULL;

ALTER TABLE salesperson MODIFY
    salary NUMBER NOT NULL;

-- �������� (�ڽ����̺� order_2/ �θ����̺� salesperson, customer_2)
-- constraint �̸��� �� ������ �ý��ۿ��� �ڵ����� ��
ALTER TABLE order_2
    ADD CONSTRAINT sales_foregin FOREIGN KEY ( salesperson )
        REFERENCES salesperson ( name );

ALTER TABLE order_2
    ADD CONSTRAINT cust_foregin FOREIGN KEY ( custname )
        REFERENCES customer_2 ( name );
        
-- customer_2
INSERT INTO customer_2 VALUES (
    'TOM',
    'colombia',
    'farming'
);

INSERT INTO customer_2 VALUES (
    'David',
    'florida',
    'computer'
);

INSERT INTO customer_2 VALUES (
    'James',
    'goorgia',
    'fishery'
);

INSERT INTO customer_2 VALUES (
    'Eric',
    'Arkansas',
    'computer'
);

INSERT INTO customer_2 VALUES (
    'Adrian',
    'cilorado',
    'farming'
);

INSERT INTO customer_2 VALUES (
    'Sofia',
    'LA',
    'fishery'
);

INSERT INTO customer_2 VALUES (
    'Julia',
    'LA',
    'farming'
);

-- salesperson
INSERT INTO salesperson VALUES (
    'kevin',
    28,
    3500
);

INSERT INTO salesperson VALUES (
    'Angel',
    32,
    4000
);

INSERT INTO salesperson VALUES (
    'daniel',
    34,
    2700
);
        
        
-- order_2
INSERT INTO order_2 VALUES (
    1,
    'TOM',
    'kevin',
    100
);

INSERT INTO order_2 VALUES (
    2,
    'David',
    'Angel',
    200
);

INSERT INTO order_2 VALUES (
    3,
    'James',
    'daniel',
    300
);

INSERT INTO order_2 VALUES (
    4,
    'Eric',
    'Angel',
    4500
);

INSERT INTO order_2 VALUES (
    5,
    'Adrian',
    'kevin',
    8000
);

INSERT INTO order_2 VALUES (
    6,
    'James',
    'kevin',
    4000
);

INSERT INTO order_2 VALUES (
    7,
    'TOM',
    'Angel',
    20000
);

INSERT INTO order_2 VALUES (
    8,
    'Eric',
    'daniel',
    6000
);

INSERT INTO order_2 VALUES (
    9,
    'David',
    'Angel',
    42000
);

INSERT INTO order_2 VALUES (
    10,
    'Eric',
    'daniel',
    7000
);

INSERT INTO order_2 VALUES (
    11,
    'Adrian',
    'daniel',
    21000
);

INSERT INTO order_2 VALUES (
    12,
    'Sofia',
    'Angel',
    25000
);

INSERT INTO order_2 VALUES (
    13,
    'Julia',
    'kevin',
    10000
);

-- DISTINCT : �ߺ��� ���� 
SELECT
    count (DISTINCT custname)
FROM
    order_2;
    
    
    
    
    
    
    
    
    
    
    
SELECT
    *
FROM
    ����;

SELECT
    *
FROM
    �󿵰�;

SELECT
    *
FROM
    ��;

SELECT
    *
FROM
    ����;

-- ���� ���� �����
/*

-- CASCADE : ������ �θ����̺� �������� ����
-- �θ����̺��� �������� �����ϰ� ������
drop table ���� CASCADE CONSTRAINTS;
drop table �� CASCADE CONSTRAINTS;
drop table �󿵰� CASCADE CONSTRAINTS;
drop table ���� CASCADE CONSTRAINTS;
alter table ���� drop constraint �󿵰�_fk cascade;

-- �ڽ����̺� �������� ����
alter table ���� add constraint �󿵰�_fk foreign key (�����ȣ) references �󿵰�(�����ȣ) on delete cascade;

*/


-- �Է� : ����
INSERT INTO ���� VALUES (
    1,
    '����',
    '����'
);

INSERT INTO ���� VALUES (
    2,
    '��Ƽ',
    '����'
);

INSERT INTO ���� VALUES (
    3,
    '��Ƽ',
    '���'
);

INSERT INTO ���� VALUES (
    4,
    'CGV',
    '����� ������'
);

INSERT INTO ���� VALUES (
    5,
    '�ް��ڽ�',
    '����� ������'
);
----------------------------------------
INSERT INTO �󿵰� VALUES (
    1,
    1,
    '�ż���',
    9000,
    35
);

INSERT INTO �󿵰� VALUES (
    2,
    1,
    '����ȣ��',
    9000,
    40
);

INSERT INTO �󿵰� VALUES (
    3,
    3,
    '���극��',
    9000,
    10
);

INSERT INTO �󿵰� VALUES (
    4,
    3,
    '������ ����',
    7000,
    50
);

INSERT INTO �󿵰� VALUES (
    5,
    3,
    '�Ű� �Բ�',
    7500,
    20
);
----------------------------------------
INSERT INTO �� VALUES (
    1,
    '�����',
    '����� ������'
);

INSERT INTO �� VALUES (
    2,
    'ȫ�浿',
    '����� ������'
);

INSERT INTO �� VALUES (
    3,
    '������',
    '����� ������'
);

INSERT INTO �� VALUES (
    4,
    '����ȣ',
    '����� ������'
);

INSERT INTO �� VALUES (
    5,
    '������',
    '����� ������'
);
----------------------------------------
INSERT INTO ���� VALUES (
    30,
    1,
    1,
    TO_DATE('2019-10-15', 'yyyy-mm-dd')
);

INSERT INTO ���� VALUES (
    25,
    1,
    2,
    TO_DATE('2019-10-15', 'yyyy-mm-dd')
);

INSERT INTO ���� VALUES (
    35,
    1,
    3,
    TO_DATE('2019-10-17', 'yyyy-mm-dd')
);

INSERT INTO ���� VALUES (
    20,
    2,
    4,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO ���� VALUES (
    10,
    3,
    3,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO ���� VALUES (
    40,
    3,
    2,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO ���� VALUES (
    45,
    1,
    2,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO ���� VALUES (
    50,
    2,
    1,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO ���� VALUES (
    55,
    3,
    1,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO ���� VALUES (
    15,
    2,
    4,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

DELETE FROM ����
WHERE
    "�¼���ȣ" = 15;
----------------------------------------

-- 1. ��� ������ �̸��� ��ġ �˻�
SELECT
    �����̸�,
    ��ġ
FROM
    ����;


-- 2. '���'�� �ִ� ���� ���� �˻�
SELECT
    �����̸�,
    ��ġ
FROM
    ����
WHERE
    ��ġ LIKE '%���%';

-- 3. '����� ������'�� ��� ���� ������ ���̵� �̸��� ��������
SELECT
    *
FROM
    ��;

SELECT
    *
FROM
    ��
WHERE
    �ּ� LIKE '%����� ������%'
ORDER BY
    �̸�;

-- 4. ������ 8,000�� ������ ��ȭ�� �����ȣ, �󿵰� ��ȣ, ��ȭ������ �˻�

SELECT
    *
FROM
    �󿵰�;

SELECT
    �����ȣ,
    �󿵰���ȣ,
    ��ȭ����
FROM
    �󿵰�
WHERE
    ���� <= 8000;

-- 5. ���� ��ġ�� ���� �ּҰ� ���� ���� �̸��� ���� ��ġ �˻�

SELECT
    *
FROM
    ����;

SELECT
    *
FROM
    ��;

SELECT
    �̸� �����̸�,
    ��ġ ������ġ
FROM
    ��,
    ����
WHERE
    ����.��ġ LIKE ��.�ּ�;


-- ����
-- 1. ������ ���� ���
SELECT
    *
FROM
    ����;

SELECT
    COUNT(DISTINCT �����̸�) �����Ǽ�
FROM
    ����;

SELECT
    COUNT(�����ȣ)
FROM
    ����;

-- 2. �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?
SELECT
    *
FROM
    �󿵰�;

SELECT
    AVG(����) ��ȭ����հ���
FROM
    �󿵰�;

-- 3. 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���

SELECT
    *
FROM
    ��;

SELECT
    *
FROM
    ����;

SELECT
    COUNT(��¥) ���Ǽ�
FROM
    ����
WHERE
    ��¥ LIKE '20/09/01';

SELECT
    COUNT(�̸�)
FROM
    ��,
    ����
WHERE
        ����.����ȣ = ��.����ȣ
    AND ��¥ LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd');


-- 4. '����' ���忡�� �󿵵� ��ȭ�� �� ���� �̸��� ��ȭ����

SELECT
    *
FROM
    ����;

SELECT
    *
FROM
    ��;

SELECT
    *
FROM
    ����;

SELECT
    *
FROM
    �󿵰�;

SELECT
    ��.�̸�,
    �󿵰�.��ȭ����,
    �󿵰�.�󿵰���ȣ
FROM
    ��,
    �󿵰�,
    ����,
    ����
WHERE
        ����.�����ȣ = �󿵰�.�����ȣ
    AND ����.����ȣ = ��.����ȣ
    AND ����.�󿵰���ȣ = �󿵰�.�󿵰���ȣ
    AND �����̸� LIKE '%����%';

SELECT
    ��.�̸�
FROM
    ��,
    ����
WHERE
    ����.�󿵰���ȣ IN (
        SELECT
            �󿵰���ȣ
        FROM
            �󿵰�
        WHERE
            �󿵰�.�����ȣ IN (
                SELECT
                    �����ȣ
                FROM
                    ����
                WHERE
                    �����̸� LIKE '����'
            )
    );

SELECT
    �󿵰���ȣ
FROM
    �󿵰�
WHERE
    �󿵰�.�����ȣ IN (
        SELECT
            �����ȣ
        FROM
            ����
        WHERE
            �����̸� LIKE '����'
    );

-- 5. ���� ���忡�� �󿵵� ��ȭ���� ( ANSI JOIN )

SELECT
    ��ȭ����
FROM
    �󿵰�
WHERE
    �󿵰�.�����ȣ IN (
        SELECT
            �����ȣ
        FROM
            ����
        WHERE
            �����̸� LIKE '����'
    );

SELECT
    ��ȭ����
FROM
         ����
    INNER JOIN �󿵰� ON ����.�����ȣ = �󿵰�.�����ȣ
                      AND �����̸� LIKE '%����%';

-- 6. ���� ������ ��ü ����

SELECT
    SUM(����)
FROM
         ����
    INNER JOIN �󿵰� ON ����."�󿵰���ȣ" = �󿵰�."�󿵰���ȣ"
    INNER JOIN ���� ON �󿵰�."�����ȣ" = ����."�����ȣ"
                     AND �����̸� LIKE '����';


-- 7. ���庰 �󿵰� �� 

SELECT
    *
FROM
    ����;

SELECT
    *
FROM
    ����;

SELECT
    *
FROM
    �󿵰�;

SELECT
    *
FROM
    ����;

SELECT
    �󿵰�."�����ȣ",
    COUNT(�����ȣ)
FROM
    �󿵰�
GROUP BY
    �����ȣ;


-- 8. 2020�� 9�� 1�Ͽ� �󿵰��� ���� ���� ��

SELECT
    *
FROM
    ��;

SELECT
    *
FROM
    ����;

SELECT
    *
FROM
    �󿵰�;

SELECT
    COUNT(��¥) ���Ǽ�
FROM
    ����
WHERE
    ��¥ LIKE '20/09/01';

SELECT
    ����.�󿵰���ȣ,
    COUNT(�̸�) ������Ǽ�
FROM
    ��,
    ����
WHERE
        ����.����ȣ = ��.����ȣ
    AND ��¥ LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd')
GROUP BY
    ����."�󿵰���ȣ";


----

SELECT
    �󿵰���ȣ,
    COUNT(*) "�󿵰� �� "
FROM
    ����
WHERE
    ��¥ LIKE TO_DATE('2020-09-01', 'yyyy-mm--dd')
GROUP BY
    "�󿵰���ȣ";


-- 9. 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ����


SELECT
    ����.�󿵰���ȣ,
    COUNT(�̸�) ������Ǽ�
FROM
    ��,
    ����,
    �󿵰�
WHERE
        ����.����ȣ = ��.����ȣ
    AND ��¥ LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd')
GROUP BY
    �󿵰�.��ȭ����;



------------------------------------------

SELECT
    ��ȭ����,
    COUNT(*)
FROM
    �󿵰�,
    ����
WHERE
        �󿵰�.�󿵰���ȣ = ����.�󿵰���ȣ
    AND ��¥ LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd')
GROUP BY
    ��ȭ����
HAVING
    COUNT(*) IN (
        SELECT
            MAX(COUNT(*))
        FROM
            �󿵰�, ����
        WHERE
                �󿵰�.�󿵰���ȣ = ����.�󿵰���ȣ
            AND ��¥ LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd')
        GROUP BY
            ��ȭ����
    );
    
    
    
    
-- 8. 2020�� 9�� 1�Ͽ� �󿵰��� ���� ���� ��
SELECT �󿵰���ȣ, COUNT(����ȣ) as �������
FROM ���� 
WHERE ���೯¥ = TO_DATE('2020-09-01', 'yyyy-mm-dd')
GROUP BY �󿵰���ȣ;

-- 9. 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ����

SELECT (SELECT ��ȭ���� FROM �󿵰� WHERE ����.�󿵰���ȣ = �󿵰�.�󿵰���ȣ) as ��ȭ����, �������
FROM (
    SELECT �󿵰���ȣ, COUNT(����ȣ) as �������
    FROM ���� 
    WHERE ��¥ = TO_DATE('2020-09-01', 'yyyy-mm-dd')
    GROUP BY �󿵰���ȣ 
    ORDER BY ������� DESC) ����;
--WHERE ROWNUM = 1;

    
      SELECT �󿵰���ȣ, COUNT(����ȣ) as �������
    FROM ���� 
    WHERE ��¥ = TO_DATE('2020-09-01', 'yyyy-mm-dd')
    GROUP BY �󿵰���ȣ 
    ORDER BY ������� DESC;
    
    
select * from �󿵰�;
    
    
    
    
    
    
    
    
    
    
    
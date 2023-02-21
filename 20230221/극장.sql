SELECT
    *
FROM
    극장;

SELECT
    *
FROM
    상영관;

SELECT
    *
FROM
    고객;

SELECT
    *
FROM
    예약;

-- 제약 조건 지우기
/*

-- CASCADE : 강제로 부모테이블 제약조건 해제
-- 부모테이블의 제약조건 해제하고 삭제됨
drop table 극장 CASCADE CONSTRAINTS;
drop table 고객 CASCADE CONSTRAINTS;
drop table 상영관 CASCADE CONSTRAINTS;
drop table 예약 CASCADE CONSTRAINTS;
alter table 극장 drop constraint 상영관_fk cascade;

-- 자식테이블 정보까지 삭제
alter table 극장 add constraint 상영관_fk foreign key (극장번호) references 상영관(극장번호) on delete cascade;

*/


-- 입력 : 극장
INSERT INTO 극장 VALUES (
    1,
    '대한',
    '강남'
);

INSERT INTO 극장 VALUES (
    2,
    '씨티',
    '강남'
);

INSERT INTO 극장 VALUES (
    3,
    '씨티',
    '잠실'
);

INSERT INTO 극장 VALUES (
    4,
    'CGV',
    '서울시 강남구'
);

INSERT INTO 극장 VALUES (
    5,
    '메가박스',
    '서울시 도봉구'
);
----------------------------------------
INSERT INTO 상영관 VALUES (
    1,
    1,
    '신세계',
    9000,
    35
);

INSERT INTO 상영관 VALUES (
    2,
    1,
    '영웅호걸',
    9000,
    40
);

INSERT INTO 상영관 VALUES (
    3,
    3,
    '러브레터',
    9000,
    10
);

INSERT INTO 상영관 VALUES (
    4,
    3,
    '범죄의 도시',
    7000,
    50
);

INSERT INTO 상영관 VALUES (
    5,
    3,
    '신과 함께',
    7500,
    20
);
----------------------------------------
INSERT INTO 고객 VALUES (
    1,
    '장민태',
    '서울시 강동구'
);

INSERT INTO 고객 VALUES (
    2,
    '홍길동',
    '서울시 도봉구'
);

INSERT INTO 고객 VALUES (
    3,
    '김유신',
    '서울시 강남구'
);

INSERT INTO 고객 VALUES (
    4,
    '오재호',
    '서울시 강남구'
);

INSERT INTO 고객 VALUES (
    5,
    '정현석',
    '서울시 도봉구'
);
----------------------------------------
INSERT INTO 예약 VALUES (
    30,
    1,
    1,
    TO_DATE('2019-10-15', 'yyyy-mm-dd')
);

INSERT INTO 예약 VALUES (
    25,
    1,
    2,
    TO_DATE('2019-10-15', 'yyyy-mm-dd')
);

INSERT INTO 예약 VALUES (
    35,
    1,
    3,
    TO_DATE('2019-10-17', 'yyyy-mm-dd')
);

INSERT INTO 예약 VALUES (
    20,
    2,
    4,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO 예약 VALUES (
    10,
    3,
    3,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO 예약 VALUES (
    40,
    3,
    2,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO 예약 VALUES (
    45,
    1,
    2,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO 예약 VALUES (
    50,
    2,
    1,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO 예약 VALUES (
    55,
    3,
    1,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

INSERT INTO 예약 VALUES (
    15,
    2,
    4,
    TO_DATE('2020-09-01', 'yyyy-mm-dd')
);

DELETE FROM 예약
WHERE
    "좌석번호" = 15;
----------------------------------------

-- 1. 모든 극장의 이름과 위치 검색
SELECT
    극장이름,
    위치
FROM
    극장;


-- 2. '잠실'에 있는 극장 정보 검색
SELECT
    극장이름,
    위치
FROM
    극장
WHERE
    위치 LIKE '%잠실%';

-- 3. '서울시 강남구'에 사는 고객의 정보를 보이되 이름을 오름차순
SELECT
    *
FROM
    고객;

SELECT
    *
FROM
    고객
WHERE
    주소 LIKE '%서울시 강남구%'
ORDER BY
    이름;

-- 4. 가격이 8,000원 이하인 영화의 극장번호, 상영관 번호, 영화제목을 검색

SELECT
    *
FROM
    상영관;

SELECT
    극장번호,
    상영관번호,
    영화제목
FROM
    상영관
WHERE
    가격 <= 8000;

-- 5. 극장 위치와 고객의 주소가 같은 고객의 이름과 극장 위치 검색

SELECT
    *
FROM
    극장;

SELECT
    *
FROM
    고객;

SELECT
    이름 고객의이름,
    위치 극장위치
FROM
    고객,
    극장
WHERE
    극장.위치 LIKE 고객.주소;


-- 집계
-- 1. 극장의 수를 출력
SELECT
    *
FROM
    극장;

SELECT
    COUNT(DISTINCT 극장이름) 극장의수
FROM
    극장;

SELECT
    COUNT(극장번호)
FROM
    극장;

-- 2. 상영되는 영화의 평균 가격은 얼마인가?
SELECT
    *
FROM
    상영관;

SELECT
    AVG(가격) 영화의평균가격
FROM
    상영관;

-- 3. 2020년 9월 1일에 영화를 관람한 고객의 수를 출력

SELECT
    *
FROM
    고객;

SELECT
    *
FROM
    예약;

SELECT
    COUNT(날짜) 고객의수
FROM
    예약
WHERE
    날짜 LIKE '20/09/01';

SELECT
    COUNT(이름)
FROM
    고객,
    예약
WHERE
        예약.고객번호 = 고객.고객번호
    AND 날짜 LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd');


-- 4. '대한' 극장에서 상영된 영화를 본 고객의 이름과 영화제목

SELECT
    *
FROM
    극장;

SELECT
    *
FROM
    고객;

SELECT
    *
FROM
    예약;

SELECT
    *
FROM
    상영관;

SELECT
    고객.이름,
    상영관.영화제목,
    상영관.상영관번호
FROM
    고객,
    상영관,
    극장,
    예약
WHERE
        극장.극장번호 = 상영관.극장번호
    AND 예약.고객번호 = 고객.고객번호
    AND 예약.상영관번호 = 상영관.상영관번호
    AND 극장이름 LIKE '%대한%';

SELECT
    고객.이름
FROM
    고객,
    예약
WHERE
    예약.상영관번호 IN (
        SELECT
            상영관번호
        FROM
            상영관
        WHERE
            상영관.극장번호 IN (
                SELECT
                    극장번호
                FROM
                    극장
                WHERE
                    극장이름 LIKE '대한'
            )
    );

SELECT
    상영관번호
FROM
    상영관
WHERE
    상영관.극장번호 IN (
        SELECT
            극장번호
        FROM
            극장
        WHERE
            극장이름 LIKE '대한'
    );

-- 5. 대한 극장에서 상영된 영화제목 ( ANSI JOIN )

SELECT
    영화제목
FROM
    상영관
WHERE
    상영관.극장번호 IN (
        SELECT
            극장번호
        FROM
            극장
        WHERE
            극장이름 LIKE '대한'
    );

SELECT
    영화제목
FROM
         극장
    INNER JOIN 상영관 ON 극장.극장번호 = 상영관.극장번호
                      AND 극장이름 LIKE '%대한%';

-- 6. 대한 극장의 전체 수입

SELECT
    SUM(가격)
FROM
         예약
    INNER JOIN 상영관 ON 예약."상영관번호" = 상영관."상영관번호"
    INNER JOIN 극장 ON 상영관."극장번호" = 극장."극장번호"
                     AND 극장이름 LIKE '대한';


-- 7. 극장별 상영관 수 

SELECT
    *
FROM
    극장;

SELECT
    *
FROM
    예약;

SELECT
    *
FROM
    상영관;

SELECT
    *
FROM
    극장;

SELECT
    상영관."극장번호",
    COUNT(극장번호)
FROM
    상영관
GROUP BY
    극장번호;


-- 8. 2020년 9월 1일에 상영관별 예약 고객의 수

SELECT
    *
FROM
    고객;

SELECT
    *
FROM
    예약;

SELECT
    *
FROM
    상영관;

SELECT
    COUNT(날짜) 고객의수
FROM
    예약
WHERE
    날짜 LIKE '20/09/01';

SELECT
    예약.상영관번호,
    COUNT(이름) 예약고객의수
FROM
    고객,
    예약
WHERE
        예약.고객번호 = 고객.고객번호
    AND 날짜 LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd')
GROUP BY
    예약."상영관번호";


----

SELECT
    상영관번호,
    COUNT(*) "상영관 수 "
FROM
    예약
WHERE
    날짜 LIKE TO_DATE('2020-09-01', 'yyyy-mm--dd')
GROUP BY
    "상영관번호";


-- 9. 2020년 9월 1일에 가장 많은 고객이 관람한 영화의 제목


SELECT
    예약.상영관번호,
    COUNT(이름) 예약고객의수
FROM
    고객,
    예약,
    상영관
WHERE
        예약.고객번호 = 고객.고객번호
    AND 날짜 LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd')
GROUP BY
    상영관.영화제목;



------------------------------------------

SELECT
    영화제목,
    COUNT(*)
FROM
    상영관,
    예약
WHERE
        상영관.상영관번호 = 예약.상영관번호
    AND 날짜 LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd')
GROUP BY
    영화제목
HAVING
    COUNT(*) IN (
        SELECT
            MAX(COUNT(*))
        FROM
            상영관, 예약
        WHERE
                상영관.상영관번호 = 예약.상영관번호
            AND 날짜 LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd')
        GROUP BY
            영화제목
    );
    
    
    
    
-- 8. 2020년 9월 1일에 상영관별 예약 고객의 수
SELECT 상영관번호, COUNT(고객번호) as 예약고객수
FROM 예약 
WHERE 예약날짜 = TO_DATE('2020-09-01', 'yyyy-mm-dd')
GROUP BY 상영관번호;

-- 9. 2020년 9월 1일에 가장 많은 고객이 관람한 영화의 제목

SELECT (SELECT 영화제목 FROM 상영관 WHERE 관람.상영관번호 = 상영관.상영관번호) as 영화제목, 예약고객수
FROM (
    SELECT 상영관번호, COUNT(고객번호) as 예약고객수
    FROM 예약 
    WHERE 날짜 = TO_DATE('2020-09-01', 'yyyy-mm-dd')
    GROUP BY 상영관번호 
    ORDER BY 예약고객수 DESC) 관람;
--WHERE ROWNUM = 1;

    
      SELECT 상영관번호, COUNT(고객번호) as 예약고객수
    FROM 예약 
    WHERE 날짜 = TO_DATE('2020-09-01', 'yyyy-mm-dd')
    GROUP BY 상영관번호 
    ORDER BY 예약고객수 DESC;
    
    
select * from 상영관;
    
    
    
    
    
    
    
    
    
    
    
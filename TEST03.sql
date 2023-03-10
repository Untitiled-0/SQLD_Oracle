-- DDL01에 있다.
SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM PROJECT;
SELECT * FROM WORKS;




-- 1.모든 사원의 이름을 보이시오

SELECT NAME 
FROM EMPLOYEE;


-- 2.여자 사원의 이름을 보이시오

SELECT NAME 
FROM EMPLOYEE
WHERE GENDER LIKE '여';

-- 3.팀장의 이름을 보이시오 (중첩질의)

SELECT ENPNO, NAME
FROM EMPLOYEE 
WHERE NAME IN ( SELECT MANAGER
                            FROM DEPARTMENT );

-- 4.IT 부서에 속하는 일하는 사원의 이름과 주소를 보이시오 

SELECT NAME, ADDRESS
FROM EMPLOYEE EM, DEPARTMENT DP
WHERE EM.DEPTNO = dp.deptno AND DEPTNAME='IT';

-- 5.홍길동 팀장 부서에서 일하는 사원의 수를 보이시오 (중첩질의)

SELECT COUNT(DEPTNO)
FROM EMPLOYEE
WHERE DEPTNO IN ( SELECT DEPTNO
                                FROM DEPARTMENT
                                WHERE MANAGER LIKE '홍길동');


-- 6.사원들이 일한 시간 수를 부서별, 사원 이름별 오름차순으로 보이시오

SELECT DEPTNO, SUM(HOURWORKED)
FROM EMPLOYEE EM, WORKS WK
WHERE EM.EMPNO = WK.EMPNO
GROUP BY EM.DEPTNO
ORDER BY DEPTNO;


-- 7.프로젝트의 번호, 이름, 사원 수를 보이시오

SELECT PR.PROJNO, PR.PROJNAME, COUNT (NAME) 사원수
FROM PROJECT PR, EMPLOYEE EM
WHERE PR.DEPTNO = EM.DEPTNO
GROUP BY PR.PROJNO, PR.PROJNAME
HAVING COUNT(*) >= 4;

-- 8.세명 이상의 사원이 있는 부서의 사원 이름을 보이시오.(중첩질의)

SELECT NAME
FROM EMPLOYEE EM1, DEPARTMENT DP1
WHERE EM1.DEPTNO=DP1.DEPTNO
AND DEPTNAME = (
SELECT DEPTNAME
FROM DEPARTMENT DP2, EMPLOYEE EM2
WHERE DP2.DEPTNO = EM2.DEPTNO
GROUP BY DEPTNAME
HAVING COUNT (*) >= 3);


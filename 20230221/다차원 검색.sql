select * from employees;
select * from job_history;

-- 월별로 입사한 사원 수 출력

select to_char(hire_date,'mm') 월, count( * ) 사원수
from employees
group by to_char(hire_date,'mm')
order by 월;


-- 방법 2
select DECODE(to_char(hire_date,'mm'), 01, count(*),0) "1 Month",        
        DECODE(to_char(hire_date,'mm'), 02, count(*),0) "2 Month",
        DECODE(to_char(hire_date,'mm'), 03, count(*),0) "3 Month",
        DECODE(to_char(hire_date,'mm'), 04, count(*),0) "4 Month",
        DECODE(to_char(hire_date,'mm'), 05, count(*),0) "5 Month",
        DECODE(to_char(hire_date,'mm'), 06, count(*),0) "6 Month",
        DECODE(to_char(hire_date,'mm'), 07, count(*),0) "7 Month",
        DECODE(to_char(hire_date,'mm'), 08, count(*),0) "8 Month",
        DECODE(to_char(hire_date,'mm'), 09, count(*),0) "9 Month",
        DECODE(to_char(hire_date,'mm'), 10, count(*),0) "10 Month",
        DECODE(to_char(hire_date,'mm'), 11, count(*),0) "11 Month",
        DECODE(to_char(hire_date,'mm'), 12, count(*),0) "12 Month"  
from employees
group by to_char(hire_date,'mm')
order by to_char(hire_date,'mm');



-- 방법 3
select sum (DECODE(to_char(hire_date,'mm'), 01, count(*),0)) "1 Month",        
       sum ( DECODE(to_char(hire_date,'mm'), 02, count(*),0)) "2 Month",
       sum ( DECODE(to_char(hire_date,'mm'), 03, count(*),0)) "3 Month",
       sum ( DECODE(to_char(hire_date,'mm'), 04, count(*),0)) "4 Month",
       sum ( DECODE(to_char(hire_date,'mm'), 05, count(*),0)) "5 Month",
       sum ( DECODE(to_char(hire_date,'mm'), 06, count(*),0)) "6 Month",
       sum ( DECODE(to_char(hire_date,'mm'), 07, count(*),0)) "7 Month",
       sum ( DECODE(to_char(hire_date,'mm'), 08, count(*),0))"8 Month",
       sum ( DECODE(to_char(hire_date,'mm'), 09, count(*),0)) "9 Month",
       sum ( DECODE(to_char(hire_date,'mm'), 10, count(*),0)) "10 Month",
       sum ( DECODE(to_char(hire_date,'mm'), 11, count(*),0)) "11 Month",
       sum ( DECODE(to_char(hire_date,'mm'), 12, count(*),0)) "12 Month"  
from employees
group by to_char(hire_date,'mm')
order by to_char(hire_date,'mm');

-- 부서번호(department_id)와 업무(job_id)를 기준으로 전체 행을 그룹별로 나눈 후 급여(salary) 합계와 인원수를 출력
select * from departments;
select * from job_history;
select * from employees;

select department_id, job_id,sum(salary) 급여합계, count(*) 인원수
from employees
group by department_id, job_id
order by department_id;

select department_id, job_id,to_char(sum(salary), '$999,999.00') 급여합계, count(*) 인원수
from employees
group by department_id, job_id
order by department_id;

/* 부서번호(department_id)와 업무(job_id)를 기준으로 전체 행을 그룹별로 나눈 후 급여(salary) 합계와 인원수
    및 부서의 업무별 총 급여합과 인원합
*/


/*
GROUPING :
ROLLUP의 경우 나열된 컬럼의 단계별로 소계, 합계를 자동으로 집계를 한다. 
그에 반해 GROUPING SETS는 여러 그룹핑 쿼리를 UNION ALL 한 것과 같은 결과를 만들 수 있어 
조금 더 유연하게 소계, 합계를 집계할 수 있다.
CUBE :
오라클에서 합계와 소계를 구하기 위해서는 ROLLUP 함수를 많이 사용한다. 
ROLLUP 함수는 소계와 합계를 순서에 맞게 반환하지만 
CUBE 함수는 계산 가능한 모든 소계와 합계를 반환한다.
*/

select department_id, job_id,to_char(sum(salary), '$999,999.00') 급여합계, count(*) 인원수, grouping(job_id) 업무구분
from employees
group by rollup(department_id, job_id)
order by department_id;


select department_id, job_id,to_char(sum(salary), '$999,999.00') 급여합계, count(*) 인원수, grouping(job_id) 업무구분
from employees
group by cube(department_id, job_id)
order by department_id;


-- 각 사원이 소속된 부서별로 급여를 기준으로 내림차순 정렬

select EMPLOYEE_id, LAST_NAME, Salary, department_id
from employees
order by department_id;

/*
오라클에서 분석함수를 사용할 때 PARTITION BY를 사용하여 그룹으로 묶어서 연산을 할 수 있다. 
GROUP BY 절을 사용하지 않고, 조회된 각 행에 그룹으로 집계된 값을 표시할 때 
OVER 절과 함께 PARTITION BY 절을 사용하면 된다.
*/

select EMPLOYEE_ID, Last_name, Salary, department_id ,
rank() over (PARTITION by department_id order by salary desc) "rank",
DENSE_rank() over (PARTITION by department_id order by salary desc) "rank",
Row_number() over (PARTITION by department_id order by salary desc) "rank"
from employees;


select department_id, sum(Salary) total
from employees
group by department_id
order by total desc;


-- First(), Last()함수를 이용한 소속된 부서별로 급여를 가장 많이 받거나 적게 받는 사원의 성을 출력
select department_id, count(*), 
max(last_name) keep (DENSE_rank FIRST order by salary desc) as "MAX_EMP_NAME",
min(last_name) keep (DENSE_rank LAST order by salary desc) as "MIN_EMP_NAME"
from employees
group by department_id;






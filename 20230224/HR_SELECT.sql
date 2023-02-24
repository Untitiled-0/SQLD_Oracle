select * from departments;
select * from employees;

select employee_id 사원번호,
first_name || '' || last_name name, 
salary 급여, 
job_id 업무, 
hire_date 입사일, 
manager_id 사원번호
from employees;

select to_char((salary*12+100),'$999,999.00') "Increase Ann_Salary", to_char((salary+100), '$999,999.00') "Increase Salary"
from employees;

/*
사원정보(Employees) 테이블에서 사원의 이름과 성은 Name, 업무는 Job, 급여는 Salary, 
연봉에 $100 보너스를 추가하여 계산한 값은 Increase Ann_Salary, 
급여에 $100 보너스를 추가하여 계산한 연봉은 Increase Salary라는 별칭을 붙여 출력하시오
*/
/*
사원정보(Employees) 테이블에서 모든 사원의 성(last_name)과 연봉을 
“성: 1 Year Salary = $연봉” 형식으로 출력하고, 
1 Year Salary라는 별칭을 붙여 출력하시오
*/


select to_char((salary*12+100),'$999,999.00') "Increase Ann_Salary", to_char((salary+100), '$999,999.00') "Increase Salary"
from employees;

--
select First_Name || ' '|| Last_Name as Name,job_id as job,
salary, (12*salary) +100 as "Increase Ann_Salary",
12*(salary+100) as "Increase Salary"
from employees
order by name,job;
--

SELECT last_name|| ' : 1 Year Salary =' || to_char(salary * 12,'$999,999.00') "1 Year Salary"
FROM Employees;


--부서별로 담당하는 업무를 한 번씩만 출력하시오

/*
H R 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다. 
사원정보(Employees) 테이블에서 급여가 $7,000~$10,000 범위 이외인 사람의 이름과 성(Name으로 별칭) 및 
급여를 급여가 적은 순서로 출력하시오
*/


select first_name || ' ' || last_name name, salary 급여
from employees
where salary BETWEEN 7000 and 10000
order by salary ;

select last_name "e or o Name"
from employees
where last_name like '%e%'
or  last_name like '%o%';

select  first_name || ' ' || last_name "name", job_id 업무, hire_date 입사일
from employees
where hire_date between to_date('2006/05/20','yyyy-mm-dd') and to_date('2007/05/20','yyyy-mm-dd')
order by 입사일;


select sysdate from dual;
select first_name||' '||last_name as Name, job_id, hire_date from employees
    where hire_date between to_date('2006-05-20','yyyy-mm-dd') and to_date('2007-05-20','yyyy-mm-dd')
    order by hire_date ;
    
    
    
select employee_id as 사원번호, last_name || ' ' || first_name as name, department_id 부서, salary as 급여, round(salary*1.123) as "Increase Salary"
from employees
where department_id = 60;


/*
각 사원의 성(last_name)이 ‘s’로 끝나는 사원의 이름과 업무를 아래의 예와 같이 출력하고자 한다. 
출력 시 이름(first_name)과 성(last_name)은 첫 글자가 대문자, 
업무는 모두 대문자로 출력하고 머리글은 Employee JOBs.로 표시하시오
예) Michael Rogers  is a ST_CLERK
*/

-- initcap : 첫번째 글자 대문자

select initcap(first_name || '  ' || last_name) ||' '|| upper(job_id) as "Employee JOB.s"
from employees
where substr(last_name,-1,1) like 's';


/*
모든 사원의 연봉을 표시하는 보고서를 작성하려고 한다. 
보고서에 사원의 이름과 성(Name으로 별칭), 급여, 수당여부에 따른 연봉을 포함하여 출력하시오. 
수당여부는 수당이 있으면 “Salary + Commission”, 수당이 없으면 “Salary only”라고 표시하고, 
별칭은 적절히 붙이시오. 또한 출력 시 연봉이 높은 순으로 정렬하시오
*/


/*
모든 사원의 이름과 성(Name으로 별칭), 입사일 그리고 입사일이 어떤 요일이었는지 출력하시오. 
이때 주(week)의 시작인 일요일부터 출력되도록 정렬하시오
*/

select first_name || ' ' || last_name as name, salary,
            (salary*12)+(salary*12*NVL(commission_pct, 0)) "Annual Salary",  --널이 있으면 0으로 표기
            NVL2 (commission_pct, 'Salary + Commission','salary only') "commission ?" --넣이 있으면 앞쪽 표시 없으면 뒤쪽 표시 (3항 연상자)
from employees
order by salary desc; --order by Salary desc



select first_name || '  ' || last_name as name, 
hire_date, to_char(hire_date, 'DAY') as "DAY of the week"
from employees
order by to_char(hire_date, 'd'); /* 월요일 : to_char(hire_date -1 , 'd')*/

/*
모든 사원은 직속 상사 및 직속 직원을 갖는다. 단, 최상위 또는 최하위 직원은 직속 상사 및 직원이 없다. 
소속된 사원들 중 어떤 사원의 상사로 근무 중인 사원의 총 수를 출력하시오
*/

select count (DISTINCT manager_id)
from employees;



/*
각 사원이 소속된 부서별로 급여 합계, 급여 평균, 급여 최댓값, 급여 최솟값을 집계하고자 한다. 
계산된 출력값은 여섯 자리와 세 자리 구분기호, $ 표시와 함께 아래와 같이 출력하시오. 
단, 부서에 소속되지 않은 사원에 대한 정보는 제외하고, 출력 시  별칭(alias) 처리하시오
*/

select * from employees;
select * from job_history;

select department_id 부서,
to_char(sum(salary),'$999,999.00') sum,
to_char(avg(salary),'$999,999.00') avg,
to_char(max(salary),'$999,999.00') max
from employees
where department_id is not null
GROUP by department_id
order by department_id; --order by Salary desc

/*
사원들의 업무별 전체 급여 평균이 $10,000보다 큰 경우를 조회하여 업무별 급여 평균을 출력하시오. 
단 업무에 사원(CLERK)이 포함된 경우는 제외하고 전체 급여 평균이 높은 순서대로 출력하시오
*/


select job_id 업무,
to_char(avg(salary),'$999,999.00') avg
from employees
where  job_id is not null and job_id not like '%CLERK%'
GROUP by job_id
having avg(salary) > 10000
order by avg(salary) desc;

/*
HR 스키마에 있는 Job_history 테이블은 사원들의 업무 변경 이력을 나타내는 테이블이다. 
이 정보를 이용하여 모든 사원의 현재 및 이전의 업무 이력 정보를 출력하고자 한다. 
중복된 사원정보가 있으면 한 번만 표시하여 출력하시오
*/



/*
사원정보(Employees) 테이블에 job_id는 사원의 현재 업무를 뜻하고, 
Job_history에 job_id는 사원의 이전 업무를 뜻한다. 
이 두 테이블을 비교해보면 어떤 사원의 업무가 변경되었고 그대로 유지되고 있는지 확인할 수 있다. 
두 테이블을 이용하여 업무 변경 없이 같은 업무를 보고 있는 사원의 사원번호와 업무를 출력하시오
*/

-- union : 합집합
-- INTERSECT  : 교집합

(select employee_id, job_id
from Job_history
union
select employee_id, job_id
from employees)

minus;
-- 같은 업무
(select employee_id, job_id
from employees
INTERSECT 
select employee_id, job_id
from Job_history);


-- 변경된적이 있으나 현재는 마지막 부서에서 같은 업무만 보고 있음
select employee_id from employees
INTERSECT
select employee_id from job_history;

-- 변경 이력이 없음
select employee_id from employees
minus
select employee_id from job_history;

-- 조건부 논리 표현식
/*
HR 부서에서는 신규 프로젝트를 성공으로 이끈 해당 업무자들의 급여를 인상하기로 결정하였다. 
사원은 현재 107명이며 19개의 업무에 소속되어 근무 중이다. 
급여 인상 대상자는 회사의 업무(Distinct job_id) 중 다음 5개 업무에서 일하는 사원에 해당된다. 
나머지 업무에 대해서는 급여가 동결된다. 5개 업무의 급여 인상안은 다음과 같다

HR_REP(10%), MK_REP(12%), PR_REP(15%), SA_REP(18%), IT_PROG(20%)

-- case문 
-- switch case문과 유사하다

*/

-- case
SELECT employee_id, last_name || ' ' || first_name as "Name", job_id, salary,
	 CASE job_id WHEN 'HR_REP' THEN 1.10 * salary
                      WHEN 'MK_REP' THEN 1.12 * salary
                      WHEN 'PR_REP' THEN 1.15 * salary
                      WHEN 'SA_REP' THEN 1.18 * salary
                      WHEN 'IT_PROG' THEN 1.20 * salary
         ELSE salary  
         END "New Salary"           
FROM Employees;


-- decode
SELECT employee_id, last_name || ' ' || first_name as "Name", job_id, salary,
    DECODE (job_id, 'HR_REP', 1.10 * salary, 'MK_REP', 1.12 * salary,
                            'PR_REP', 1.15 * salary, 'SA_REP', 1.18 * salary,
                            'IT_PROG', 1.20 * salary, salary) "New Salary"         
FROM Employees;




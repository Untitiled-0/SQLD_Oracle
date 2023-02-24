select * from departments;
select * from employees;

select employee_id �����ȣ,
first_name || '' || last_name name, 
salary �޿�, 
job_id ����, 
hire_date �Ի���, 
manager_id �����ȣ
from employees;

select to_char((salary*12+100),'$999,999.00') "Increase Ann_Salary", to_char((salary+100), '$999,999.00') "Increase Salary"
from employees;

/*
�������(Employees) ���̺��� ����� �̸��� ���� Name, ������ Job, �޿��� Salary, 
������ $100 ���ʽ��� �߰��Ͽ� ����� ���� Increase Ann_Salary, 
�޿��� $100 ���ʽ��� �߰��Ͽ� ����� ������ Increase Salary��� ��Ī�� �ٿ� ����Ͻÿ�
*/
/*
�������(Employees) ���̺��� ��� ����� ��(last_name)�� ������ 
����: 1 Year Salary = $������ �������� ����ϰ�, 
1 Year Salary��� ��Ī�� �ٿ� ����Ͻÿ�
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


--�μ����� ����ϴ� ������ �� ������ ����Ͻÿ�

/*
H R �μ����� ���� �� ������ �޿� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
�������(Employees) ���̺��� �޿��� $7,000~$10,000 ���� �̿��� ����� �̸��� ��(Name���� ��Ī) �� 
�޿��� �޿��� ���� ������ ����Ͻÿ�
*/


select first_name || ' ' || last_name name, salary �޿�
from employees
where salary BETWEEN 7000 and 10000
order by salary ;

select last_name "e or o Name"
from employees
where last_name like '%e%'
or  last_name like '%o%';

select  first_name || ' ' || last_name "name", job_id ����, hire_date �Ի���
from employees
where hire_date between to_date('2006/05/20','yyyy-mm-dd') and to_date('2007/05/20','yyyy-mm-dd')
order by �Ի���;


select sysdate from dual;
select first_name||' '||last_name as Name, job_id, hire_date from employees
    where hire_date between to_date('2006-05-20','yyyy-mm-dd') and to_date('2007-05-20','yyyy-mm-dd')
    order by hire_date ;
    
    
    
select employee_id as �����ȣ, last_name || ' ' || first_name as name, department_id �μ�, salary as �޿�, round(salary*1.123) as "Increase Salary"
from employees
where department_id = 60;


/*
�� ����� ��(last_name)�� ��s���� ������ ����� �̸��� ������ �Ʒ��� ���� ���� ����ϰ��� �Ѵ�. 
��� �� �̸�(first_name)�� ��(last_name)�� ù ���ڰ� �빮��, 
������ ��� �빮�ڷ� ����ϰ� �Ӹ����� Employee JOBs.�� ǥ���Ͻÿ�
��) Michael Rogers  is a ST_CLERK
*/

-- initcap : ù��° ���� �빮��

select initcap(first_name || '  ' || last_name) ||' '|| upper(job_id) as "Employee JOB.s"
from employees
where substr(last_name,-1,1) like 's';


/*
��� ����� ������ ǥ���ϴ� ������ �ۼ��Ϸ��� �Ѵ�. 
������ ����� �̸��� ��(Name���� ��Ī), �޿�, ���翩�ο� ���� ������ �����Ͽ� ����Ͻÿ�. 
���翩�δ� ������ ������ ��Salary + Commission��, ������ ������ ��Salary only����� ǥ���ϰ�, 
��Ī�� ������ ���̽ÿ�. ���� ��� �� ������ ���� ������ �����Ͻÿ�
*/


/*
��� ����� �̸��� ��(Name���� ��Ī), �Ի��� �׸��� �Ի����� � �����̾����� ����Ͻÿ�. 
�̶� ��(week)�� ������ �Ͽ��Ϻ��� ��µǵ��� �����Ͻÿ�
*/

select first_name || ' ' || last_name as name, salary,
            (salary*12)+(salary*12*NVL(commission_pct, 0)) "Annual Salary",  --���� ������ 0���� ǥ��
            NVL2 (commission_pct, 'Salary + Commission','salary only') "commission ?" --���� ������ ���� ǥ�� ������ ���� ǥ�� (3�� ������)
from employees
order by salary desc; --order by Salary desc



select first_name || '  ' || last_name as name, 
hire_date, to_char(hire_date, 'DAY') as "DAY of the week"
from employees
order by to_char(hire_date, 'd'); /* ������ : to_char(hire_date -1 , 'd')*/

/*
��� ����� ���� ��� �� ���� ������ ���´�. ��, �ֻ��� �Ǵ� ������ ������ ���� ��� �� ������ ����. 
�Ҽӵ� ����� �� � ����� ���� �ٹ� ���� ����� �� ���� ����Ͻÿ�
*/

select count (DISTINCT manager_id)
from employees;



/*
�� ����� �Ҽӵ� �μ����� �޿� �հ�, �޿� ���, �޿� �ִ�, �޿� �ּڰ��� �����ϰ��� �Ѵ�. 
���� ��°��� ���� �ڸ��� �� �ڸ� ���б�ȣ, $ ǥ�ÿ� �Բ� �Ʒ��� ���� ����Ͻÿ�. 
��, �μ��� �Ҽӵ��� ���� ����� ���� ������ �����ϰ�, ��� ��  ��Ī(alias) ó���Ͻÿ�
*/

select * from employees;
select * from job_history;

select department_id �μ�,
to_char(sum(salary),'$999,999.00') sum,
to_char(avg(salary),'$999,999.00') avg,
to_char(max(salary),'$999,999.00') max
from employees
where department_id is not null
GROUP by department_id
order by department_id; --order by Salary desc

/*
������� ������ ��ü �޿� ����� $10,000���� ū ��츦 ��ȸ�Ͽ� ������ �޿� ����� ����Ͻÿ�. 
�� ������ ���(CLERK)�� ���Ե� ���� �����ϰ� ��ü �޿� ����� ���� ������� ����Ͻÿ�
*/


select job_id ����,
to_char(avg(salary),'$999,999.00') avg
from employees
where  job_id is not null and job_id not like '%CLERK%'
GROUP by job_id
having avg(salary) > 10000
order by avg(salary) desc;

/*
HR ��Ű���� �ִ� Job_history ���̺��� ������� ���� ���� �̷��� ��Ÿ���� ���̺��̴�. 
�� ������ �̿��Ͽ� ��� ����� ���� �� ������ ���� �̷� ������ ����ϰ��� �Ѵ�. 
�ߺ��� ��������� ������ �� ���� ǥ���Ͽ� ����Ͻÿ�
*/



/*
�������(Employees) ���̺� job_id�� ����� ���� ������ ���ϰ�, 
Job_history�� job_id�� ����� ���� ������ ���Ѵ�. 
�� �� ���̺��� ���غ��� � ����� ������ ����Ǿ��� �״�� �����ǰ� �ִ��� Ȯ���� �� �ִ�. 
�� ���̺��� �̿��Ͽ� ���� ���� ���� ���� ������ ���� �ִ� ����� �����ȣ�� ������ ����Ͻÿ�
*/

-- union : ������
-- INTERSECT  : ������

(select employee_id, job_id
from Job_history
union
select employee_id, job_id
from employees)

minus;
-- ���� ����
(select employee_id, job_id
from employees
INTERSECT 
select employee_id, job_id
from Job_history);


-- ��������� ������ ����� ������ �μ����� ���� ������ ���� ����
select employee_id from employees
INTERSECT
select employee_id from job_history;

-- ���� �̷��� ����
select employee_id from employees
minus
select employee_id from job_history;

-- ���Ǻ� �� ǥ����
/*
HR �μ������� �ű� ������Ʈ�� �������� �̲� �ش� �����ڵ��� �޿��� �λ��ϱ�� �����Ͽ���. 
����� ���� 107���̸� 19���� ������ �ҼӵǾ� �ٹ� ���̴�. 
�޿� �λ� ����ڴ� ȸ���� ����(Distinct job_id) �� ���� 5�� �������� ���ϴ� ����� �ش�ȴ�. 
������ ������ ���ؼ��� �޿��� ����ȴ�. 5�� ������ �޿� �λ���� ������ ����

HR_REP(10%), MK_REP(12%), PR_REP(15%), SA_REP(18%), IT_PROG(20%)

-- case�� 
-- switch case���� �����ϴ�

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




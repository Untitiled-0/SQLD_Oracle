select * from employees;
select * from job_history;

-- ������ �Ի��� ��� �� ���

select to_char(hire_date,'mm') ��, count( * ) �����
from employees
group by to_char(hire_date,'mm')
order by ��;


-- ��� 2
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



-- ��� 3
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

-- �μ���ȣ(department_id)�� ����(job_id)�� �������� ��ü ���� �׷캰�� ���� �� �޿�(salary) �հ�� �ο����� ���
select * from departments;
select * from job_history;
select * from employees;

select department_id, job_id,sum(salary) �޿��հ�, count(*) �ο���
from employees
group by department_id, job_id
order by department_id;

select department_id, job_id,to_char(sum(salary), '$999,999.00') �޿��հ�, count(*) �ο���
from employees
group by department_id, job_id
order by department_id;

/* �μ���ȣ(department_id)�� ����(job_id)�� �������� ��ü ���� �׷캰�� ���� �� �޿�(salary) �հ�� �ο���
    �� �μ��� ������ �� �޿��հ� �ο���
*/


/*
GROUPING :
ROLLUP�� ��� ������ �÷��� �ܰ躰�� �Ұ�, �հ踦 �ڵ����� ���踦 �Ѵ�. 
�׿� ���� GROUPING SETS�� ���� �׷��� ������ UNION ALL �� �Ͱ� ���� ����� ���� �� �־� 
���� �� �����ϰ� �Ұ�, �հ踦 ������ �� �ִ�.
CUBE :
����Ŭ���� �հ�� �Ұ踦 ���ϱ� ���ؼ��� ROLLUP �Լ��� ���� ����Ѵ�. 
ROLLUP �Լ��� �Ұ�� �հ踦 ������ �°� ��ȯ������ 
CUBE �Լ��� ��� ������ ��� �Ұ�� �հ踦 ��ȯ�Ѵ�.
*/

select department_id, job_id,to_char(sum(salary), '$999,999.00') �޿��հ�, count(*) �ο���, grouping(job_id) ��������
from employees
group by rollup(department_id, job_id)
order by department_id;


select department_id, job_id,to_char(sum(salary), '$999,999.00') �޿��հ�, count(*) �ο���, grouping(job_id) ��������
from employees
group by cube(department_id, job_id)
order by department_id;


-- �� ����� �Ҽӵ� �μ����� �޿��� �������� �������� ����

select EMPLOYEE_id, LAST_NAME, Salary, department_id
from employees
order by department_id;

/*
����Ŭ���� �м��Լ��� ����� �� PARTITION BY�� ����Ͽ� �׷����� ��� ������ �� �� �ִ�. 
GROUP BY ���� ������� �ʰ�, ��ȸ�� �� �࿡ �׷����� ����� ���� ǥ���� �� 
OVER ���� �Բ� PARTITION BY ���� ����ϸ� �ȴ�.
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


-- First(), Last()�Լ��� �̿��� �Ҽӵ� �μ����� �޿��� ���� ���� �ްų� ���� �޴� ����� ���� ���
select department_id, count(*), 
max(last_name) keep (DENSE_rank FIRST order by salary desc) as "MAX_EMP_NAME",
min(last_name) keep (DENSE_rank LAST order by salary desc) as "MIN_EMP_NAME"
from employees
group by department_id;






select * from employees where salary >= 10000;

-- index�� å ���� å����
-- �˻� �ӵ��� ��������. 

create index ix_emple on employees(salary);
drop index ix_emple;

select * from employees where salary >= 10000;

select * from employees where job_id = 'AD_VP';


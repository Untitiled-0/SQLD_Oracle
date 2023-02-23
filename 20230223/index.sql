select * from employees where salary >= 10000;

-- index란 책 속의 책갈피
-- 검색 속도가 빨라진다. 

create index ix_emple on employees(salary);
drop index ix_emple;

select * from employees where salary >= 10000;

select * from employees where job_id = 'AD_VP';


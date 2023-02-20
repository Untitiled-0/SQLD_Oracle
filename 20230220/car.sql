-- 자동차 프로젝트
-- 부품, 자동차 회사, 자동차, 부품_자동차

--part_id
create table 부품(
part_id varchar2(20),
part_name varchar(20),
year varchar(20)
);


-- 기본키 : com_id
create table 자동차회사(
com_id varchar(20) , 
name varchar(20) , 
city varchar(20),
nation varchar(20));


-- 기본키 : name
create table 자동차(
name varchar(20), 
com_id varchar(20) , 
com_name varchar(20)
);

-- 기본키 : part_id, name
create table 부품_자동차(
part_id varchar(20), 
name varchar(20)

);

-- 제약조건
-- 기본키
-- primary key 삭제
--alter table 부품_자동차 drop primary key;
-- alter table 자동차회사 drop constraint 자동차회사_pk;

alter table 부품 add primary key (part_id) ;
alter table 자동차회사 add primary key (com_id) ;
alter table 자동차 add primary key (name) ;
alter table 부품_자동차 add primary key (part_id,name) ;



-- 참조조건 (자동차회사 => 자동차)

alter table 자동차 add constraint 자동차_회사 Foreign key (name) references 자동차회사(com_id) on delete cascade;


-- 부품, 자동차 => 부품_자동차

alter table 부품_자동차 add constraint 부품_fk Foreign key (part_id) references 부품(part_id) on delete cascade;
alter table 부품_자동차 add constraint 자동차이름_fk Foreign key (name) references 자동차(name) on delete cascade;


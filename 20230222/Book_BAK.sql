-- 백업 프로시져
-- madang

-- 원본
drop table books;
create table books(
    ID int primary key,
    name varchar2(20),
    writer varchar(20) not null,
    price number(10,2) default 100,
    genre varchar2(20) not null,
    publisher varchar2(20) not null,
    cnt number(10) default 0
);

-- 백업 테이블 
drop table books_BAK;
create table books_BAK(
    ID int primary key,
    name varchar2(20),
    writer varchar(20) not null,
    price number(10,2) default 100,
    genre varchar2(20) not null,
    publisher varchar2(20) not null,
    cnt number(10) default 0
);


select * from books;
select * from books_bak;

drop SEQUENCE books_seqid;
create SEQUENCE books_seqid
minvalue 1 
--start with 1
INCREMENT BY 1 ;

insert into books(id, name, writer , price,genre,publisher) values(books_seqid.nextval, '레미제라블','빅토르 위고',30000,'소설','빅토르 출판사');
insert into books(id, name, writer ,genre, publisher, cnt) values(books_seqid.nextval, '홍길동전','허균','소설','허균 출판사',2);


create or replace procedure backup_books(
    book_id in books.id%type -- books 테이블 id와 같은 type의 컬럼 생성(외부에서 받는 값에 대한 변수방)
)
is -- as, 
    CURSOR csor is select id, name, writer, price, genre, publisher, cnt
    from books
    where id = book_id; -- 매개변수로 받은 아이디와 일치하는 아이디가 있을때 커서 생성
    b_id books.id%type;
    b_name books.name%type;
    b_writer books.writer%type;
    b_price books.price%type;
    b_genre books.genre%type;
    b_publisher books.publisher%type;
    b_cnt books.cnt%type;
begin
    OPEN csor;
        Loop -- 반복 시작
            fetch csor into b_id, b_name, b_writer,b_price, b_genre, b_publisher, b_cnt;
            exit when csor%notFOUND; -- loop문 빠져나옴 
            Insert into books_bak values( b_id, b_name, b_writer,b_price, b_genre, b_publisher, b_cnt);    
            commit; -- 완료
        end Loop;
    CLOSE csor;
end;
/
exec backup_books(2);


insert into books_bak values(
select * from books where bookdate = sysdate);

-- ��� ���ν���
-- madang

-- ����
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

-- ��� ���̺� 
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

insert into books(id, name, writer , price,genre,publisher) values(books_seqid.nextval, '���������','���丣 ����',30000,'�Ҽ�','���丣 ���ǻ�');
insert into books(id, name, writer ,genre, publisher, cnt) values(books_seqid.nextval, 'ȫ�浿��','���','�Ҽ�','��� ���ǻ�',2);


create or replace procedure backup_books(
    book_id in books.id%type -- books ���̺� id�� ���� type�� �÷� ����(�ܺο��� �޴� ���� ���� ������)
)
is -- as, 
    CURSOR csor is select id, name, writer, price, genre, publisher, cnt
    from books
    where id = book_id; -- �Ű������� ���� ���̵�� ��ġ�ϴ� ���̵� ������ Ŀ�� ����
    b_id books.id%type;
    b_name books.name%type;
    b_writer books.writer%type;
    b_price books.price%type;
    b_genre books.genre%type;
    b_publisher books.publisher%type;
    b_cnt books.cnt%type;
begin
    OPEN csor;
        Loop -- �ݺ� ����
            fetch csor into b_id, b_name, b_writer,b_price, b_genre, b_publisher, b_cnt;
            exit when csor%notFOUND; -- loop�� �������� 
            Insert into books_bak values( b_id, b_name, b_writer,b_price, b_genre, b_publisher, b_cnt);    
            commit; -- �Ϸ�
        end Loop;
    CLOSE csor;
end;
/
exec backup_books(2);


insert into books_bak values(
select * from books where bookdate = sysdate);

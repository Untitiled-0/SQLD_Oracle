-- DML : DATA Manupulation Language;
/*

    SELECT FROM WHERE
    INSERT INTO VALUES
    DELETE FROM
    UPDATE SET WHERE


*/

SELECT
    *
FROM
    book;

INSERT INTO book (
    bookid,
    bookname,
    publisher
) VALUES (
    14,
    '스포츠 의학 ',
    '솔데스크'
);


-- 대량 삽입 (bulk insert)
INSERT INTO book (
    bookid,
    bookname,
    publisher,
    price
)
    SELECT
        bookid,
        bookname,
        publisher,
        price
    FROM
        imported_book;

INSERT INTO imported_book (
    bookid,
    bookname,
    publisher,
    price
)
    SELECT
        bookid,
        bookname,
        publisher,
        price
    FROM
        book
    WHERE
        bookid BETWEEN 1 AND 14;

SELECT
    bookid,
    bookname,
    publisher,
    price
FROM
    imported_book;

--GRANT select, insert, update, delete ON SOLDESK.tb_newbook to madang;

SELECT
    *
FROM
    soldesk.tb_newbook;

INSERT INTO soldesk.tb_newbook (
    bookid,
    bookname,
    publisher,
    price
)
    SELECT
        bookid,
        bookname,
        publisher,
        price
    FROM
        book;
        
        
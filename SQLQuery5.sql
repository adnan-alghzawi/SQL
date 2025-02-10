CREATE DATABASE LIBRARY;

CREATE TABLE BOOKS(
BookID INT PRIMARY KEY,
Title VARCHAR(20),
AuthorID INT UNIQUE , 
PublishedYear INT ,
CopiesAvailable INT,
BookCategory VARCHAR(20) );

CREATE TABLE AUTHORS(
AUTHOR_ID INT PRIMARY KEY , 
FIRST_NAME VARCHAR(10),
LAST_NAME VARCHAR(10),
BIRTH_YEAR DATE );

INSERT INTO BOOKS (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) VALUES
(101, 'Sky High', 1, 2001, 5, 'Fiction'),
(102, 'Deep Sea', 2, 2003, 3, 'Science'),
(103, 'Mountain Call', 3, 1999, 2, 'Adventure'),
(104, 'Desert Sun', 4, 2005, 4, 'Travel'),
(105, 'City Lights', 5, 2008, 6, 'Romance');

INSERT INTO AUTHORS (AUTHOR_ID, FIRST_NAME, LAST_NAME, BIRTH_YEAR) VALUES
(1, 'John', 'Doe', '1975-01-15'),
(2, 'Jane', 'Smith', '1980-06-24'),
(3, 'Emily', 'Jones', '1962-11-08'),
(4, 'Michael', 'Brown', '1954-09-02'),
(5, 'Jessica', 'Davis', '1988-12-19');

SELECT * FROM BOOKS;
SELECT * FROM AUTHORS;

SELECT * FROM BOOKS
WHERE CopiesAvailable = (SELECT MAX(CopiesAvailable) FROM BOOKS);

SELECT * FROM BOOKS
WHERE CopiesAvailable = (SELECT MIN(CopiesAvailable) FROM BOOKS);

SELECT AVG(PublishedYear) AS AVG_PUB FROM BOOKS;

SELECT COUNT(BookID) AS TOTAL_BOOKS FROM BOOKS;

TRUNCATE TABLE BOOKS;

ALTER TABLE AUTHORS
ADD Email VARCHAR(50);
ALTER TABLE AUTHORS
ADD Phone_Number VARCHAR(10);

DROP TABLE AUTHORS;
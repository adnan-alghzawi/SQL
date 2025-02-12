create table members(ID int primary key,name varchar(255),contactInfo varchar(255),memberShipType varchar(255),registrationDate date);

create table libraryStaff(ID int primary key , name varchar(255),contactInfo varchar(255),assignedSection varchar(255) , employmentDate date);

create table category(ID int primary key,name varchar(255),description varchar(255));

create table books(ID int primary key,title varchar(255),author varchar(255),genre varchar(255),publicationYear int, availabilityStatus varchar(255),categoryID int ,
FOREIGN KEY (categoryID) REFERENCES category(ID));

create table borrowing(ID int primary key , memberID int , bookID int , borrowingDate date , dueDate date ,returnDate date,
FOREIGN KEY (memberID) REFERENCES members(ID),
FOREIGN KEY (bookID) REFERENCES books(ID));

create table reservatios(ID int primary key , memberID int , bookID int , reservationDate date , status varchar(255),
FOREIGN KEY (memberID) REFERENCES members(ID),
FOREIGN KEY (bookID) REFERENCES books(ID));

INSERT INTO members (ID, name, contactInfo, memberShipType, registrationDate)
VALUES 
(1, 'John Doe', '1234567890', 'Standard', '2023-01-01'),
(2, 'Jane Smith', '2345678901', 'Premium', '2023-02-15'),
(3, 'Emily Johnson', '3456789012', 'Standard', '2023-03-20'),
(4, 'Chris Lee', '4567890123', 'Premium', '2023-04-25'),
(5, 'Mike Brown', '5678901234', 'Standard', '2023-05-30');

INSERT INTO libraryStaff (ID, name, contactInfo, assignedSection, employmentDate)
VALUES 
(1, 'Sarah Connors', '6789012345', 'Lending', '2022-01-10'),
(2, 'Alex Green', '7890123456', 'Reference', '2022-05-20'),
(3, 'Jessica Blue', '8901234567', 'Children’s Literature', '2022-08-15'),
(4, 'Robert White', '9012345678', 'Archives', '2022-09-01'),
(5, 'Laura Black', '0123456789', 'Digital Media', '2022-11-21');

INSERT INTO category (ID, name, description)
VALUES 
(1, 'Fiction', 'Fiction books including novels and short stories'),
(2, 'Non-Fiction', 'Informative and factual books'),
(3, 'Science Fiction', 'Books based on speculative or futuristic science'),
(4, 'Biography', 'Books about individuals'),
(5, 'Children', 'Books written specifically for children');

INSERT INTO books (ID, title, author, genre, publicationYear, availabilityStatus, categoryID)
VALUES 
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Historical Fiction', 1960, 'Available', 1),
(2, '1984', 'George Orwell', 'Dystopian', 1949, 'Available', 3),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925, 'On Loan', 1),
(4, 'A Brief History of Time', 'Stephen Hawking', 'Science', 1988, 'Available', 2),
(5, 'The Boy Who Harnessed the Wind', 'William Kamkwamba', 'Biography', 2009, 'On Loan', 4);

INSERT INTO borrowing (ID, memberID, bookID, borrowingDate, dueDate, returnDate)
VALUES 
(1, 1, 3, '2025-02-01', '2025-02-28', NULL),
(2, 2, 5, '2025-01-15', '2025-02-15', '2025-02-15'),
(3, 3, 1, '2025-02-05', '2025-03-05', NULL),
(4, 4, 2, '2025-02-07', '2025-03-07', NULL),
(5, 5, 4, '2025-01-20', '2025-02-20', '2025-02-18');

INSERT INTO reservatios (ID, memberID, bookID, reservationDate, status)
VALUES 
(1, 5, 3, '2025-02-10', 'Pending'),
(2, 4, 1, '2025-02-12', 'Completed'),
(3, 3, 2, '2025-02-15', 'Pending'),
(4, 2, 4, '2025-01-25', 'Cancelled'),
(5, 1, 5, '2025-02-20', 'Completed');

--Select members who registered on a specific date
--👉 Question:
--Write an SQL query to find all members who registered on 2023-01-01.
select * from members
where members.registrationDate='2023-01-01';

--Select details of a book by its title
--👉 Question:
--Write an SQL query to retrieve all details of a book titled "To Kill a Mockingbird".
select * from books
where books.title='To Kill a Mockingbird';

--Add a new column ‘Email’ to the Members table
--👉 Question:
--The Members table is missing an Email column. Write an SQL query to add an Email column with a data type suitable for storing email addresses.
alter table members
add Email varchar(255);
--select * from members;

--4. Insert a new member record
--👉 Question:
--Write an SQL query to insert a new member with the following details:

--Name: Omar
--Contact: 9876543210
--Membership Type: Student
--Registration Date: 5-6-2024
--Email: Omar@gmail.com
INSERT INTO members (ID, name, contactInfo, memberShipType, registrationDate, Email)
VALUES 
(6, 'Omar', '9876543210', 'Student', '2024-06-05', 'Omar@gmail.com');
--select * from members;

--. Select members who have reservations in the system
--👉 Question:
--Write an SQL query to find all members who have made a book reservation.

select * from members
inner join reservatios on members.ID=reservatios.memberID;

--. Select members who have borrowed a specific book
--👉 Question:
--Write an SQL query to find members who have borrowed the book titled "The Great Gatsby".
 
 select * from members
 inner join borrowing on members.ID=borrowing.memberID
 inner join books on borrowing.bookID=books.id
 where books.title='The Great Gatsby';

-- Select members who have borrowed and returned a specific book
--👉 Question:
--Write an SQL query to find all members who have borrowed and returned the book titled "A Brief History of Time".

select * from members
inner join borrowing on members.ID=borrowing.memberID
 inner join books on borrowing.bookID=books.id
 where books.title='A Brief History of Time' and borrowing.returnDate is not null;

-- . Find members who made a late return
--👉 Question:
--Write an SQL query to find members who have returned books after the due date.
select * from members
inner join borrowing on members.ID=borrowing.memberID
 where borrowing.returnDate>borrowing.dueDate;

-- . Select books borrowed more than 3 times
--👉 Question:
--Write an SQL query to find books that have been borrowed more than 3 times.

--select * from books
--inner join borrowing on borrowing.bookID=books.ID
--having count(borrowing.bookID) >3;

--SELECT *, COUNT(borrowing.bookID) AS BorrowCount  
--from books
--inner join borrowing on books.ID=borrowing.bookID
--GROUP BY books.ID, books.title, books.author, books.genre, books.publicationYear, books.availabilityStatus, books.categoryID
--having COUNT(borrowing.bookID)>3;
SELECT books.*, COUNT(borrowing.bookID) AS BorrowCount
FROM books
JOIN borrowing ON books.ID = borrowing.bookID
GROUP BY books.ID, books.title, books.author, books.genre, books.publicationYear, books.availabilityStatus, books.categoryID
HAVING COUNT(borrowing.bookID) > 3;

--Find members who have borrowed books between two dates
--👉 Question:
--Write an SQL query to find members who have borrowed a book between 2025-02-01, and 2025-02-28.
select * from members
inner join borrowing on members.ID=borrowing.memberID
 where borrowing.borrowingDate between '2025-02-01' and '2025-02-28';

-- Count the total number of books in the library
--👉 Question:
--Write an SQL query to count the total number of books available in the library.
select  count(*)as totalAvailable 
from books
where books.availabilityStatus='available';
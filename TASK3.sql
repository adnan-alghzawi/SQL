-- Create TEACHERS table
CREATE TABLE TEACHERS (
    ID INT PRIMARY KEY,
    TEACHER_NAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(50) UNIQUE NOT NULL
);

-- Create TEACHERS_DETAILS table
CREATE TABLE TEACHERS_DETAILS (
    ID INT PRIMARY KEY,
    ADDRESS VARCHAR(50) NOT NULL,
    TEACHER_ID INT UNIQUE NOT NULL,
    FOREIGN KEY (TEACHER_ID) REFERENCES TEACHERS(ID)
);

-- Create STUDENTS table
CREATE TABLE STUDENTS (
    ID INT PRIMARY KEY,
    STUDENT_NAME VARCHAR(50) NOT NULL
);

-- Create COURSES table
CREATE TABLE COURSES (
    ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(50) NOT NULL,
    TEACHER_ID INT,
    FOREIGN KEY (TEACHER_ID) REFERENCES TEACHERS(ID)
);

-- Create a junction table for the many-to-many relationship between Students and Courses
CREATE TABLE COURSE_STUDENT (
    COURSE_ID INT,
    STUDENT_ID INT,
    FOREIGN KEY (COURSE_ID) REFERENCES COURSES(ID),
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(ID)
);
INSERT INTO TEACHERS (ID, TEACHER_NAME, EMAIL) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com'),
(2, 'Bob Smith', 'bob.smith@example.com'),
(3, 'Carol White', 'carol.white@example.com'),
(4, 'David Brown', 'david.brown@example.com'),
(5, 'Eve Davis', 'eve.davis@example.com');

INSERT INTO TEACHERS_DETAILS (ID, ADDRESS, TEACHER_ID) VALUES
(1, '1234 Elm Street', 1),
(2, '2345 Maple Street', 2),
(3, '3456 Oak Street', 3),
(4, '4567 Pine Street', 4),
(5, '5678 Cedar Street', 5);

INSERT INTO STUDENTS (ID, STUDENT_NAME) VALUES
(1, 'Michael Green'),
(2, 'Sandra Yellow'),
(3, 'Luke Skywalker'),
(4, 'Leia Organa'),
(5, 'Han Solo');

INSERT INTO COURSES (ID, COURSE_NAME, TEACHER_ID) VALUES
(1, 'Mathematics 101', 1),
(2, 'Physics 101', 2),
(3, 'Chemistry 101', 3),
(4, 'Biology 101', 4),
(5, 'History 101', 5);

INSERT INTO COURSE_STUDENT (COURSE_ID, STUDENT_ID) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


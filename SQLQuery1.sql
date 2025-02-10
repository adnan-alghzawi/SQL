-- one to one
CREATE TABLE Users (
    ID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE UserProfiles (
    ProfileID INT PRIMARY KEY,
    UserID INT UNIQUE,
    FullName VARCHAR(100),
    DateOfBirth DATE,
    FOREIGN KEY (UserID) REFERENCES Users(ID)
);

--//////////////////////////////////////////////////////////////////////
-- one to may
CREATE TABLE Authors (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Nationality VARCHAR(50)
);

CREATE TABLE Books (
    BookID INT  PRIMARY KEY,
    AuthorID INT,
    Title VARCHAR(50) NOT NULL,
    PublishedYear INT,
    Genre VARCHAR(50),
    FOREIGN KEY (AuthorID) REFERENCES Authors(ID)
);

--//////////////////////////////////////////////////////////////////////
-- many to many
CREATE TABLE Students (
    ID INT  PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    EnrollmentYear INT
);
CREATE TABLE Courses (
    ID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Credits INT
);
CREATE TABLE Students_Courses (
    StudentID INT,
    CourseID INT,
    --EN_ID 
   
    FOREIGN KEY (StudentID) REFERENCES Students(ID),
    FOREIGN KEY (CourseID) REFERENCES Courses(ID)
);




-- Create the database
CREATE DATABASE bookManagement;

-- Use the database
USE bookManagement;

-- Create the Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Create the Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    ISBN VARCHAR(13),
    PublishedYear INT,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create the Borrowers table
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Create a table to track book borrowings
CREATE TABLE BookBorrowings (
    BorrowingID INT PRIMARY KEY,
    BorrowerID INT,
    BookID INT,
    BorrowedDate DATE,
    DueDate DATE,
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Create a user and set a password
CREATE USER library_user IDENTIFIED BY 'password';

-- Grant privileges to the user
GRANT SELECT, INSERT, UPDATE, DELETE ON Authors TO library_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Books TO library_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON Borrowers TO library_user;
GRANT SELECT, INSERT ON BookBorrowings TO library_user;

-- Create the database
CREATE DATABASE StudentManagement;

-- Use the database
USE StudentManagement;

-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100)
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Instructor VARCHAR(100)
);

-- Create Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert values into Students table
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Email)
VALUES
    (1, 'John', 'Doe', '1995-05-15', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', '1998-09-20', 'jane.smith@example.com');

-- Insert values into Courses table
INSERT INTO Courses (CourseID, CourseName, Instructor)
VALUES
    (101, 'Mathematics', 'Prof. Johnson'),
    (102, 'History', 'Prof. Anderson');

-- Insert values into Enrollments table
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
    (1001, 1, 101, '2023-08-01'),
    (1002, 1, 102, '2023-08-01'),
    (1003, 2, 101, '2023-08-02');

SELECT * FROM Students;

-- Create a new user
CREATE USER 'student_admin'@'localhost' IDENTIFIED BY 'password';

-- Grant privileges to the user on the StudentManagement database
GRANT SELECT, INSERT, UPDATE ON StudentManagement.* TO 'student_admin'@'localhost';

-- Revoke DELETE privilege from the user on Enrollments table
REVOKE SELECT, INSERT, UPDATE ON StudentManagement.* FROM 'student_admin'@'localhost';





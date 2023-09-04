-- Create the Database
CREATE DATABASE Management;

-- Use the Database
USE Management;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    GPA DECIMAL(3, 2)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE
);

-- Insert sample data
INSERT INTO Students (StudentID, FirstName, LastName, Age, GPA)
VALUES
    (1, 'John', 'Doe', 20, 3.5),
    (2, 'Jane', 'Smith', 21, 3.8),
    (3, 'Mike', 'Johnson', 19, 3.2);

INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES
    (101, 'Mathematics', 4),
    (102, 'History', 3),
    (103, 'Computer Science', 4);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
    (1, 1, 101, '2023-01-15'),
    (2, 1, 102, '2023-01-15'),
    (3, 2, 101, '2023-01-16');
    
-- Relational and boolean operators
SELECT FirstName, LastName
FROM Students
WHERE Age >= 20 AND GPA >= 3.5;

-- Pattern matching
SELECT FirstName, LastName
FROM Students
WHERE LastName LIKE 'D%';

-- Arithmetic operations
SELECT FirstName, LastName, GPA * 10 AS GPA_Scaled
FROM Students;

-- Built-in functions
SELECT FirstName, LastName, UPPER(FirstName) AS UppercaseFirstName
FROM Students;

-- Count the number of students
SELECT COUNT(*) AS TotalStudents
FROM Students;

-- Calculate the average GPA
SELECT AVG(GPA) AS AverageGPA
FROM Students;

-- Calculate the total credits for a student
SELECT s.FirstName, s.LastName, SUM(c.Credits) AS TotalCredits
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID
WHERE s.StudentID = 1;

-- Subquery to find students enrolled in Mathematics
SELECT FirstName, LastName
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID = 101
);

-- Subquery to find students with the highest GPA
SELECT FirstName, LastName
FROM Students
WHERE GPA = (
    SELECT MAX(GPA)
    FROM Students
);

-- Find unique students across two courses (UNION)
SELECT FirstName, LastName
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID = 101
)
UNION
SELECT FirstName, LastName
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID = 102
);

-- Find students enrolled in both Mathematics and Computer Science (INTERSECT)
SELECT FirstName, LastName
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID = 101
) 
INTERSECT 
SELECT FirstName, LastName
FROM Students
WHERE StudentID IN (
    SELECT StudentID
    FROM Enrollments
    WHERE CourseID = 103
);




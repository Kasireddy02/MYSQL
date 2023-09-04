-- Create the database
CREATE DATABASE empManagement;

-- Use the database
USE empManagement;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'Engineering'),
    (3, 'Sales');

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES
    (1, 'John', 'Doe', 1, 60000.00),
    (2, 'Jane', 'Smith', 2, 75000.00),
    (3, 'Mike', 'Johnson', 2, 80000.00),
    (4, 'Emily', 'Williams', 3, 55000.00);

-- Create a view to list employees and their departments
CREATE VIEW EmployeeDepartments AS
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Create a view to display employees with a salary greater than a specific threshold
CREATE VIEW HighSalaryEmployees AS
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees
WHERE Salary > 70000.00;

-- Create a view that shows the total number of employees in each department
CREATE VIEW EmployeeCountByDepartment AS
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

-- Query the EmployeeDepartments view
SELECT * FROM EmployeeDepartments;

-- Query the HighSalaryEmployees view
SELECT * FROM HighSalaryEmployees;

-- Query the EmployeeCountByDepartment view
SELECT * FROM EmployeeCountByDepartment;




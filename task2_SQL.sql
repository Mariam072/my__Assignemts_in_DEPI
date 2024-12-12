-- Create the database

CREATE DATABASE campany;

-- create tables 
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    manager_id INT,
    department_id INT
);




CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    d_name VARCHAR(50)
);

CREATE TABLE suppliers (
    supplier_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    status INTEGER NOT NULL
);

-- fill the table with data 

INSERT INTO employees (emp_id, name, last_name, salary, manager_id, department_id) VALUES
(1, 'John', 'Doe', 3000, 101, 1),
(2, 'Jane', 'Smith', 2500, 102, 2),
(3, 'Alice', 'Johnson', 4000, 103, 3),
(4, 'Bob', 'Brown', 2000, 200, 4),
(5, 'Charlie', 'Davis', 5000, 101, 1),
(6, 'Emma', 'Wilson', 2200, 102, 3),
(7, 'Oliver', 'Taylor', 3200, 104, 2),
(8, 'Sophia', 'Martinez', 4500, 105, 4);


INSERT INTO departments (department_id, d_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');

INSERT INTO suppliers (supplier_id, name, status) VALUES
(1, 'Alpha Supplies', 20),
(2, 'Beta Distributors', 10),
(3, 'Gamma Traders', 30),
(4, 'Delta Industries', 15),
(5, 'Epsilon Goods', 25);


--save data

commit

-- display the first table

SELECT * FROM employees

--Task 1: Creating a Simple View 
--Question: 
--Create a simple view named vw_employee_details that displays the first name, last name, and 
--department name of employees. 
--Instructions: 
--1. Use the CREATE VIEW statement to define a new view. 
--2. Select the columns fname, lname, and dname (department name) from the appropriate 
--tables. 
--3. Use JOIN to connect the employees and departments tables using the department ID.
CREATE VIEW vw_employee_details AS
SELECT 
    emp.name AS fname, 
    emp.last_name AS lname, 
    dep.name AS dname
FROM 
    employees emp
JOIN 
    departments dep
ON 
    emp.department_id = dep.department_id;

SELECT * FROM vw_employee_details

--Task 2: Modifying a View 
--Question: 
--Modify the existing view vw_work_hrs to only include employees working in department 
--number 5. 
--Instructions: 
--1. Use the CREATE OR REPLACE VIEW statement to update the view. 
--2. Filter the results using the WHERE clause to include only employees with department 
--number 5. 
--3. Ensure that the columns selected are fname, lname, pname, and hours. 

CREATE OR REPLACE VIEW vw_work_hrs AS
SELECT 
    emp.name AS fname, 
    emp.last_name AS lname, 
    dep.name AS dname
FROM 
    employees emp
JOIN 
    departments dep 
ON 
    emp.department_id = dep.department_id
WHERE 
    emp.department_id = 5;

SELECT * FROM vw_work_hrs

--Task 3: Creating Views with Check Option 
--Question: 
--Create a view named vw_high_status_suppliers to display all suppliers with a status greater 
--than 15, and ensure that any updates or inserts through the view still meet the status condition. 
--Instructions: 
--1. Use the CREATE VIEW statement to define the view. 
--2. Include the WITH CHECK OPTION to enforce that all modifications through the view 
--adhere to the condition that status must be greater than 15. 
--3. Use a SELECT statement to pull all columns from the suppliers table. 


CREATE VIEW vw_high_status_suppliers AS
SELECT *
FROM suppliers
WHERE status > 15
WITH CHECK OPTION;

SELECT * FROM vw_high_status_suppliers






-- Student_Number: sba22090
-- Name: Federico
-- Last_Name: Ariton
-- Software_develp._level_7


-- 1
-- Selecting first name, last name and hire date from employees table
-- Filtering results where hire date is not null
-- Ordering results by last name in ascending order and first name in 

SELECT 
	first_name, last_name, hire_date
FROM 
	employees
WHERE
	hire_date 
ORDER BY 
	last_name ASC, first_name DESC;

-- 2
-- Selecting  COUNT(*) function to count the number
-- of rows that meet the condition specified in the WHERE clause.
-- and where bigger or equals then date selected

SELECT
	COUNT(*) as num_employees_hired
FROM
	employees
WHERE
	hire_date >= '1992-12-01';


-- 3
-- Selecting the gender column from the employees 
-- table and the average salary from the salaries table.
-- FROM clause specifies the tables to join, including the employees
-- table joined with the titles table on the emp_no column and the salaries table joined on the emp_no column.
-- The WHERE  filters the results to only include senior engineers who currently have a salary record to_date is '9999-01-01'.
-- The GROUP BY clause groups the results by gender, so that the average salary is calculated for each gender separately.

SELECT 
  e.gender, 
  AVG(s.salary) as average_salary 
FROM 
  employees e 
  JOIN titles t ON e.emp_no = t.emp_no 
  JOIN salaries s ON e.emp_no = s.emp_no 
WHERE 
  t.title = 'Senior Engineer' 
  AND s.to_date = '9999-01-01' 
GROUP BY 
  e.gender;

-- 4
-- Selects the count of all rows returned by the query and assigns the name employee_count to the resulting column
-- Specifies that the query will be selecting data from two tables, employees and dept_emp. 
-- The ON clause is used to join the two tables based on the emp_no column.

SELECT 
  COUNT(*) as employee_count 
FROM 
  employees e 
  JOIN dept_emp de ON e.emp_no = de.emp_no 
WHERE                      -- Filters the results to only include employees whose last name starts with the letter    
  e.last_name LIKE 'E%'    -- 'E' and whose department end date has not yet passed
AND                        --
  de.to_date >= NOW();
  
-- 5
-- Selects the job title and the average salary for employees who are currently employed. 
-- It joins the employees table with the titles table and the salaries table using the employee number as the key.
-- and filters the results to only include salaries and titles that are currently active, indicated by a to_date that
-- is greater than or equal to the current date.
-- It groups the results by job title and calculates the average salary for each group.

SELECT 
  t.title as job_title, 
  AVG(s.salary) as avg_salary 
FROM 
  employees e 
  JOIN titles t ON e.emp_no = t.emp_no 
  JOIN salaries s ON e.emp_no = s.emp_no 
WHERE 
  s.to_date >= NOW() 
  AND t.to_date >= NOW() 
GROUP BY 
  t.title;

-- 6
--  selects the first name, last name and hire date of
--  employees whose first name is 'Georgi', birth date
--  is between 1958-01-01 and 1961-12-31 and who currently hold a title.  

SELECT 
  e.first_name, 
  e.last_name, 
  e.hire_date 
FROM 
  employees e 
  JOIN titles t ON e.emp_no = t.emp_no 
WHERE 
  e.first_name = 'Georgi' 
  AND e.birth_date BETWEEN '1958-01-01' AND '1961-12-31' 
  AND t.to_date = '9999-01-01';
  
-- 7  
-- Create a new view that retrieves the department number
-- Selecting the statement that joins the departments table with the dept_emp table on the department number
-- and filters out former employees using the condition dept_emp.to_date = '9999-01-01'. The resulting rows are
-- grouped by department number and name using GROUP BY and the COUNT function is used to count the number of employees in each group.
-- The HAVING clause filters out any groups with a count less than 5000.

CREATE VIEW large_departments AS
SELECT
 departments.dept_no, departments.dept_name, COUNT(*) as employee_count
FROM
 departments
JOIN
 dept_emp 
 ON departments.dept_no = dept_emp.dept_no
WHERE
 dept_emp.to_date = '9999-01-01' -- only consider current employees
GROUP BY 
	departments.dept_no, departments.dept_name
HAVING 
	COUNT(*) >= 5000;
    
-- 8
-- Selects the department name, first name, last name, and birth date of employees in large departments.  
-- Each table is joined with the correspondent
-- and the result is ordered by department name    

SELECT
	d.dept_name, e.first_name, e.last_name, e.birth_date
FROM
	employees e
JOIN
	dept_emp de
	ON e.emp_no = de.emp_no
JOIN
	departments d
	ON de.dept_no = d.dept_no
JOIN large_departments ld
	ON d.dept_no = ld.dept_no
ORDER BY 
	d.dept_name;
    
-- 9   
-- ALTER TABLE  modifies an existing table named "employees"
-- add email_address in the table with the VARCHAR(120)
-- the VARCHAR(120) the maximum length of 120 characters. 
 
ALTER TABLE
	employees
 ADD
	email_address VARCHAR(120);

-- 10
-- updates an existing row in the "employees" table
-- set sets the value of the email_address column to
-- email_addres  for the row where the first_name is 
-- 'Sumant' and the last_name is 'Peac'

UPDATE 
	employees
SET
 email_address = 'sumant.peac@mycompany.com'
WHERE
	first_name = 'Sumant'
 AND 
	last_name = 'Peac';

-- 11
-- deletes rows from the "dept_emp" table
-- WHERE  the condition is that the value
-- of the to_date column must not be equal to '9999-01-01'
-- This means that any rows where an employee's department 
-- has ended will be deleted from the table.

DELETE FROM
	dept_emp
WHERE
	to_date != '9999-01-01';

-- 12
-- Creates a new table named "training"
-- trainer_no is the primary key of the table
-- autu_incremented is used for increment the number of the key
-- by 1 for each row
-- Creating the first_name and last name with maximum 30 characters
-- -- subject is an optional field, of type varchar with a maximum length of 20 characters
CREATE TABLE training (
  trainer_no int NOT NULL AUTO_INCREMENT,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL,
  subject varchar(20),
  PRIMARY KEY (trainer_no)
);

-- 13
-- ALTER TABLE It changes the data type of the column from varchar(20) to varchar(50)
-- because the value of 20 is exceeding for the word ‘Accounting Principles’

ALTER TABLE training MODIFY COLUMN subject varchar(50);

-- Inserts data into the "training" table
-- It inserts two new rows into the table, with values
-- for the "first_name", "last_name", and "subject" columns.
INSERT INTO
  training (first_name, last_name, subject)
VALUES
	('Mariam', 'Hambrick', 'Accounting Principles'),
	('Mary', 'Moore', 'Spreadsheets');

-- 14
-- This will delete the entire "training" table and all of its data.
DROP TABLE training;

  
  

  
  
  






# Database Design and Queries with MySQL

## Overview

This project involves designing, normalizing, and querying a MySQL database for an employee management system. The project covers conceptual and logical database design, normalization to 3NF, and execution of complex SQL queries for data manipulation and analysis.

---

## Objectives

1. **Database Design**:
   - Create a conceptual diagram using Chen notation.
   - Develop a logical ER model and convert it into a relational schema.

2. **Normalization**:
   - Normalize the database from UNF to 3NF to reduce redundancy and improve data integrity.

3. **SQL Queries**:
   - Perform various SQL queries, including data retrieval, aggregation, and manipulation.

---

## Database Design

### Conceptual Diagram
- Created using **Chen notation** to depict entities (e.g., Employee, Department, Manager) and their relationships.
- Relationships include:
  - One-to-many between Employee and Salary.
  - One-to-one between Employee and Manager.

### Logical ER Model
- Defined entities with primary and foreign keys:
  - `Employee`: `employee_id` (PK).
  - `Department`: `department_id` (PK).
  - `Salary`: `employee_id` (FK), `job_title_id` (FK).
  - `Manager`: `employee_id` (FK), `department_id` (FK).

---

## Normalization

- **UNF to 3NF**:
  - Initial single table split into multiple tables: `Employee_Details`, `Job_History`, `Salary_History`, and `Manager_History`.
  - Eliminated transitive dependencies by creating separate tables for `Department` and `Location`.
- **Final Schema**:
  - `Employee_Details` (`employee_id`, `name`, `gender`, `date_of_birth`, `hire_date`, `department_id`, `location_id`).
  - `Job_History` (`employee_id`, `job_id`, `start_date`, `end_date`).
  - `Salary_History` (`employee_id`, `salary_id`, `salary_amount`, `start_date`, `end_date`).
  - `Manager_History` (`employee_id`, `manager_id`, `manager_name`, `start_date`, `end_date`).

---

## SQL Queries and Tasks

### Data Retrieval
1. **Sort Employee Names**:
   - Query to sort by last name (ascending) and first name (descending).
2. **Employees Hired After 1992**:
   - Query to count employees hired after December 1, 1992.

### Aggregations
3. **Average Salary**:
   - Query to calculate the average salary of employees with the title "Senior Engineer".
4. **Job Title Statistics**:
   - Return the average salary for each job title.

### Data Manipulation
5. **Update Records**:
   - Update email addresses for specific employees.
6. **Delete Records**:
   - Delete records in `dept_emp` where `to_date` is not `9999-01-01`.

### Advanced Tasks
7. **Views**:
   - Create a view for departments with 5,000+ employees.
8. **Create and Drop Tables**:
   - Create, modify, and delete tables with specific constraints.

---

## How to Use

1. **Setup Environment**:
   - Install MySQL and connect to your database.
   - Import the schema using provided scripts.

2. **Run Queries**:
   - Execute SQL queries for data retrieval, manipulation, and analysis.

3. **Validate Outputs**:
   - Compare outputs with provided figures in the report.

---

## Key Takeaways

- Normalized database design ensures data integrity and reduces redundancy.
- Complex SQL queries enable meaningful data analysis and manipulation.
- Views and advanced query techniques simplify recurring analytical tasks.

---

## Files

- **`schema.sql`**: SQL script for creating and normalizing the database schema.
- **`queries.sql`**: SQL queries for data analysis and manipulation.
- **`report.pdf`**: Detailed report on database design and query outputs.

---

## Author

Federico Ariton  
[GitHub Profile](https://github.com/federicoariton)  
[LinkedIn Profile](https://www.linkedin.com/in/federico-ariton-090b18218/)

---

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

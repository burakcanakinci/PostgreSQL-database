-------- DROP TABLES IF THEY EXIST --------
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;

-------- CREATE THE TABLES --------

-- EMPLOYEE TITLES table
-- Assumptions:
-- i) A title can be entered into the system but it doesn't have to immediately be assigned to an employee.
CREATE TABLE titles (
    title_id VARCHAR NOT NULL PRIMARY KEY,
    title VARCHAR
);

-- DEPARTMENTS table
-- Assumptions:
-- i) A department can have one or more managers.
-- ii) A department can have one or more department employees.
CREATE TABLE departments (
    dept_no VARCHAR NOT NULL PRIMARY KEY,
    dept_name VARCHAR
);

-- EMPLOYEES table
-- Assumptions:
-- i) Each employee must have one title.
-- ii) Each employee can only be the manager of one department at the most.
-- iii) An employee can work in many departments.
-- iv) Each employee has one salary.
CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR,
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR,
    hire_date DATE,
	FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);


-- SALARIES table
-- Assumptions:
-- i) Each row's primary key is a unique combination of each employee's id and salary.
-- ii) Each record belongs to one employee.
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

-- DEPARTMENT MANAGER table
-- Assumptions:
-- i) Each row's primary key is a unique combination of each employee's id and department number.
-- ii) Every department manager record belongs to one department and one employee.
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

-- DEPARTMENT EMPLOYEE table
-- Assumptions:
-- i) Each row's primary key is a unique combination of each employee's id and department number.
-- ii) Every department employee record belongs to one department and one employee.
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)	
);

-- CHANGE THE DATE STYLE OF THE DATABASE TO MATCH THE DATA
ALTER DATABASE "Employees" SET datestyle TO "ISO, MDY"; 
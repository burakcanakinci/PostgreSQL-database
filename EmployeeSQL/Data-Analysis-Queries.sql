-- DATA ANALYSIS


-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS "employee number", e.last_name AS "last name", e.first_name AS "first name", e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name AS "first name", last_name AS "last name", TO_CHAR(hire_date :: DATE, 'dd/mm/yyyy') AS "hire date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY "first name", "last name"; -- (List results by first name then by last name to present them better).


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no AS "department number", d.dept_name AS "department name", dp.emp_no AS "manager''s employee number", e.last_name AS "last name", e.first_name AS "first name"
FROM departments d
INNER JOIN dept_manager dp ON dp.dept_no = d.dept_no
INNER JOIN employees e ON e.emp_no = dp.emp_no;


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee number", e.last_name AS "last name", e.first_name AS "first name", d.dept_name AS "department name"
FROM departments d
INNER JOIN dept_emp dpe ON dpe.dept_no = d.dept_no
INNER JOIN employees e ON e.emp_no = dpe.emp_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name AS "first name", last_name AS "last name", sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY "last name"; -- (List results by last name to present them better).


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee number", e.last_name AS "last name", e.first_name AS "first name",  d.dept_name AS "department name"
FROM employees e
INNER JOIN dept_emp dpe ON dpe.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no = dpe.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no; -- (List results by employee number to present them better).


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee number", e.last_name AS "last name", e.first_name AS "first name", d.dept_name AS "department name"
FROM employees e
INNER JOIN dept_emp dpe ON dpe.emp_no = e.emp_no
INNER JOIN departments d ON dpe.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no; -- (List results by employee number to present them better).


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name as "last name", count(last_name) as "frequency"
FROM employees
GROUP BY "last name" 
ORDER BY "frequency" DESC, last_name; 
-- (After names have been listed in descending frequency, 
-- then list names which have the same frequency count in ascending order to present the results better).


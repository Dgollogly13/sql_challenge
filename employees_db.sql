CREATE TABLE departments(
	department_number VARCHAR(30),
	department_name VARCHAR(30));
	
CREATE TABLE dept_employees(
	employee_number INT,
	department_number VARCHAR(30),
	from_date DATE,
	to_date DATE);
	
CREATE TABLE managers(
	department_number VARCHAR (30),
	employee_number INT,
	from_date DATE,
	to_date DATE);
	
CREATE TABLE employees(
	employee_number INT,
	birth_date DATE, 
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	gender VARCHAR (30),
	hire_date DATE);
	
CREATE TABLE salaries(
	employee_number INT,
	salary INT,
	from_date DATE,
	to_date DATE);
	
CREATE TABLE titles(
	employee_number INT,
	title VARCHAR (50),
	from_date DATE,
	to_date DATE);

SELECT * FROM employees;

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT  
	e.first_name, 
	e.last_name, 
	e.gender,
	s.salary
FROM employees as e
	INNER JOIN salaries as s ON
e.employee_number=s.employee_number;

-- 2. List employees who were hired in 1986.

SELECT e.employee_number, e.last_name, e.first_name, e.gender
	FROM employees as e 
WHERE EXTRACT(YEAR from e.hire_date)='1986';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dm.department_number, departments.department_name, dm.employee_number, 
employees.first_name, employees.last_name, dm.from_date, dm.to_date
	FROM managers as dm
LEFT JOIN departments on dm.department_number = departments.department_number
	LEFT JOIN employees on dm.employee_number = employees.employee_number;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT d.department_name, employees.employee_number, employees.last_name, employees.first_name
	FROM departments as d
LEFT JOIN dept_employees ON d.department_number = dept_employees.department_number
	LEFT JOIN employees ON dept_employees.employee_number = employees.employee_number;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
	FROM employees WHERE (first_name = 'Hercules' AND last_name LIKE '%B%');
	
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT departments.department_name, employees.employee_number, employees.last_name, employees.first_name
	FROM dept_employees as d_e
LEFT JOIN employees ON d_e.employee_number = employees.employee_number
	LEFT JOIN departments ON departments.department_number = d_e.department_number
WHERE departments.department_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
e.employee_number, e.first_name, e.last_name, departments.department_name
	FROM employees as e
LEFT JOIN dept_employees
	ON e.employee_number = dept_employees.employee_number
LEFT JOIN departments
	ON departments.department_number = departments.department_number 
WHERE departments.department_name lIKE 'Sales';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT employees.last_name,
	COUNT(last_name) AS "name_count"
FROM employees
	GROUP BY last_name
ORDER BY name_count DESC;
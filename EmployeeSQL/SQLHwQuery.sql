--Look at each table
SELECT * FROM departments
SELECT * FROM employees
SELECT * FROM titles
SELECT * FROM salaries
SELECT * FROM dept_manager
SELECT * FROM dept_emp

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON
e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE extract(year FROM hire_date) = 1986;

--3. List the manager of each department with the following information: department number, 
--   department name, the manager's employee number, last name, first name.
SELECT e.emp_no, e.last_name, e.first_name, t.title, dm.dept_no, d.dept_name
FROM employees e
INNER JOIN titles t ON e.title_id = t.title_id
INNER JOIN dept_manager dm ON e.emp_no = dm.emp_no
INNER JOIN departments d ON dm.dept_no = d.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dm.dept_name
FROM employees e
INNER JOIN dept_emp d ON e.emp_no = d.emp_no
INNER JOIN departments dm ON dm.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dm.dept_name
FROM employees e
INNER JOIN dept_emp d ON e.emp_no = d.emp_no
INNER JOIN departments dm ON dm.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dm.dept_name
FROM employees e
INNER JOIN dept_emp d ON e.emp_no = d.emp_no
INNER JOIN departments dm ON dm.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS frequency_lastname
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;




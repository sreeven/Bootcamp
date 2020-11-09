-- # Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no, departments.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept_manager
LEFT JOIN departments ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees emp ON dept_manager.emp_no = emp.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, departments.dept_name
FROM employees emp
LEFT JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees emp
INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
INNER JOIN departments dept ON dept.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name
FROM employees emp
WHERE emp_no IN
	(SELECT dept_emp.emp_no
	FROM dept_emp
	WHERE dept_emp.dept_no IN (SELECT dept_no
					 FROM departments
					 WHERE dept_name = 'Sales' OR dept_name = 'Development'));

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT emp.last_name, COUNT(emp.last_name)
FROM employees emp
GROUP BY last_name 
ORDER BY COUNT(emp.last_name) DESC;

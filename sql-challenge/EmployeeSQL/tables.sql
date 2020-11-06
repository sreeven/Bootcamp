-- CREATE TABLES

CREATE TABLE departments(
	dept_no VARCHAR(55) NOT NULL,
	dept_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
	title_id VARCHAR(10) NOT NULL,
	title VARCHAR (255) NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees(
	emp_no VARCHAR(55) NOT NULL,
	emp_title_id VARCHAR(50) NOT NULL,
	birth_date VARCHAR (50),
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50),
	sex VARCHAR (10),
	hire_date VARCHAR (50),
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id)
		REFERENCES titles(title_id)
);

CREATE TABLE dept_emp(
	emp_no VARCHAR(55) NOT NULL,
	dept_no VARCHAR(55) NOT NULL,
	FOREIGN KEY (dept_no)
		REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no)
		REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(55) NOT NULL,
	emp_no VARCHAR(55) NOT NULL,
	FOREIGN KEY (dept_no)
		REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no)
		REFERENCES employees(emp_no)
);

CREATE TABLE salaries(
	emp_no VARCHAR(55) NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no)
		REFERENCES employees(emp_no)
);


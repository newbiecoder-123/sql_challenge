-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE departments (
    dept_no VARCHAR(255) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(255) PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    title_id VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(255) NOT NULL,
    hire_date DATE   NOT NULL,
	FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

--Junction table
CREATE TABLE dept_manager (
    dept_no VARCHAR(255) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

--Junction table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(255) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
   emp_no INT PRIMARY KEY NOT NULL,
   salary INT NOT NULL,
   FOREIGN KEY (emp_no) REFERENCES employees(emp_no)  
);

-----------------------
--Use this to drop tables if there are errors and need to recreate tables
DROP TABLE IF EXISTS departments
DROP TABLE IF EXISTS employees
DROP TABLE IF EXISTS titles
DROP TABLE IF EXISTS salaries
DROP TABLE IF EXISTS dept_manager
DROP TABLE IF EXISTS dept_emp


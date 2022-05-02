-- **SETUP FOR DELIVERABLE 1**

-- Note Tables are being created in a specific order to account for primary and foreign keys
-- Step 1: Creating table for departments
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
-- Import Departments csv file into newly created table.
-- Check out what was created
SELECT * FROM public.departments
ORDER BY dept_no ASC


-- Step 2: Create table for employees
CREATE TABLE employees (
	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
-- Import Employees csv file into newly created table.
-- Check out what was created
SELECT * FROM public.employees
ORDER BY emp_no ASC


-- Step 3: Create table for dept manager
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
-- Import dept manager csv file into newly created table.
-- Check out what was created
SELECT * FROM public.dept_manager
ORDER BY dept_no ASC, emp_no ASC 


-- Step 4: Create table for dep_emp
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
-- Import dept_emp csv file into newly created table.
-- Check out what was created
SELECT * FROM public.dept_emp
ORDER BY emp_no ASC, dept_no ASC 


-- Step 5: Create table for salaries
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
-- Import salaries csv file into newly created table.
-- Check out what was created
SELECT * FROM public.salaries
ORDER BY emp_no ASC 


-- Step 6: Create titles table "emp_no", "title", "from_date", "to_date"
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(60) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);
-- Import titles csv file into newly created table.
-- Check out what was created
SELECT * FROM public.titles
ORDER BY emp_no ASC, title ASC, from_date ASC 
-- **DELIVERABLE 1**

-- Step 1: 
-- To create view:
-- CREATE VIEW retirement_titles AS
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
-- filter on birth_date
WHERE (e.birth_date BETWEEN ('1951-01-01') AND ('1955-12-31'))
ORDER BY e.emp_no;
-- check the queried table:
SELECT * FROM public.retirement_titles LIMIT 10

-- Using Starter Code:
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

-- Check the queried table
SELECT * FROM public.unique_titles LIMIT 10


-- Step 16-22 of Deliverable 1
-- retiring_titles table creation
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title 
ORDER BY count DESC;

-- Check the queried table
SELECT * FROM public.retiring_titles LIMIT 7


-- **DELIVERABLE 2**
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01' AND (e.birth_date BETWEEN ('1965-01-01') AND ('1965-12-31'))
ORDER BY e.emp_no

-- Check the queried table
SELECT * FROM public.mentorship_eligibilty LIMIT 10
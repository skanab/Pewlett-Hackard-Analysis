SELECT em.emp_no,
       em.first_name,
	   em.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_challange_table
FROM employees as em
INNER JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO retirement_unique_title_challange_table
FROM retirement_challange_table
ORDER BY emp_no, to_date DESC;


SELECT COUNT(uti.title), uti.title
INTO retirement_title_count_challange_table
FROM retirement_unique_title_challange_table AS uti
GROUP BY uti.title
ORDER BY COUNT(uti.title) DESC;

SELECT DISTINCT ON (em.emp_no) em.emp_no,
       em.first_name,
	   em.last_name,
	   em.birth_date,
	   dem.from_date,
	   dem.to_date,
	   ti.title
--INTO mentor_challnage_table
FROM employees as em
INNER JOIN dept_emp AS dem
ON (em.emp_no = dem.emp_no)
INNER JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (ti.to_date = '9999-01-01')
ORDER BY em.emp_no;
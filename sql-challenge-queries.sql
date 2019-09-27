DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


--1.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.gender, salaries.salary
FROM Employees
JOIN salaries
ON Employees.emp_no = salaries.emp_no;

--2.
SELECT first_name, last_name, hire_date 
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'


--3. 
SELECT Departments.dept_no, Departments.dept_name, dept_manager.emp_no, Employees.last_name, Employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM Departments 
JOIN dept_manager ON Departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = Employees.emp_no;

--4. 
SELECT dept_emp.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM dept_emp
JOIN Employees ON dept_emp.emp_no = Employees.emp_no
JOIN Departments ON dept_emp.dept_no = Departments.dept_no;

--5.
SELECT first_name, last_name
FROM Employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.
SELECT dept_emp.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM dept_emp
JOIN Employees ON dept_emp.emp_no = Employees.emp_no
JOIN Departments ON dept_emp.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales';

--7. 
SELECT dept_emp.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM dept_emp
JOIN Employees ON dept_emp.emp_no = Employees.emp_no
JOIN Departments ON dept_emp.dept_no = Departments.dept_no
WHERE Departments.dept_name = 'Sales' OR Departments.dept_name = 'Development';

--8.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM Employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
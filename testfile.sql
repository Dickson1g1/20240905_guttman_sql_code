/* Find the avarage salary of the male and female employees in each
department
*/
USE employees;
SELECT
  d.dept_name, e.gender, de.dept_no, AVG(salary) 'salary'
FROM
  salaries s
JOIN
  employees e ON s.emp_no = e.emp_no
JOIN
  dept_emp de ON e.emp_no = de.emp_no
JOIN
  departments d ON d.dept_no = de.dept_no
GROUP BY de.dept_no, e.gender
ORDER BY de.dept_no;

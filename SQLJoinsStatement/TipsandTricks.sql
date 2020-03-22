/* 
obtain the names of all departments and calculate the average salary paid to the managers in each of them
the dept_name is in the departments table, the salary is in the salaries table, this two table has no direct relation
one should look for key column, which are commom between the tables involved in the analysis and are necessary to solve the task at hand
this column do not need to be foreign or private keys
*/

/*
just one row, if you forget to GROUP BY departments name, MySQL will apply a default order to the departments and deliver only the first one
the output we obtain is a table with all departments and the average amount of salaries paid per department
these department names can be sorted by a field we have not explicitly metioned
could omit the table indication in the group by section, if a column name is encountered only once throughtout the join tables
*/

SELECT 
    d.dept_name, AVG(s.salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING average_salary > 60000
ORDER BY average_salary DESC;

SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;
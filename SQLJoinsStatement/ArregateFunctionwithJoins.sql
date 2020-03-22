/*
using Aggregate Function means the data must be grouped by field of interest
if SELECT the emp_no, it will representing a gender delivering the first values is simply how MySQL behaves
when it is asked to extract a single value from a column that groups data
*/

SELECT 
    e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;
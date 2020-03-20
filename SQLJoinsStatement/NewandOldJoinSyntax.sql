/*
INNER JOIN syntax
therefore there are several entries with the same employee number
professional call such entries connection points
the JOIN syntax allows you to modify the connection between table easily, it can apply a LEFT or RIGHT JOIN easily
*/

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

/*
WHERE, the old JOIN syntax
in this syntax, the WHERE clause must be followed by the connectiong point
using WHERE is more time-consuming, because the computational approach for obtaining the required data is inefficient
the WHERE syntax is perceived as morally old and is rarely employed by professionals 
*/

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    departments_dup d
WHERE
    m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, dm.dept_no
FROM
    employees e
        INNER JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;


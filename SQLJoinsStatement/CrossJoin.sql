/*
CROSS JOIN will take the values from a certain table and connect them with all the values from the tables we want to join with
this is in contrast to the INNER JOIN that typically connects only two matching values
the CROSS JOIN will connect to all the values not just those that match
in the mathematical point of view a CROSS JOIN is the cartesian product of the values two or more sets
the CROSS JOIN particularly useful when the tables in a database are not well connected
*/

# we want to obtain a result set with the data containing all the department managers in the department they can be assigned 
# this means we will need all the data from the dept_manager table to JOIN all the data from the departments table

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

# without the ON keyword, the result are identical
# in this case, SQL will interpret this join as a CROSS JOIN

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    e.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
        JOIN
    employees e ON dm.emp_no = e.emp_no
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;


SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_name;

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;

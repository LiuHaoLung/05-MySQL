/*
DELETE statement can removing the record from a database
the syntax is DELETE FROM table_name WHERE conditions;
*/

# it can preserving the full data set

COMMIT;

# the to_date is null, suggest he is still working at the company

SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;

DELETE FROM employees 
WHERE
    emp_no = 999903;

# through the DELETE statement, the record is gone, and properly deleted the information 

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;

/*
when delete this information from the employees table, the titles record will be deleted too
because this two tables have the connection
in the titles table's DDL, it can see the foreign key constraint, also have ON DELETE CASCADE clause
*/
    
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
ROLLBACK;


/*
if we are not set the WHERE conditions of a DELETE statement, then it will taking a big risk
this could potentially lead to removal of all the tables records
don't forget to attach a condition in the WHERE clause, unless you want to lose all the information
*/

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

# all the records will be deleted

DELETE FROM departments_dup;

ROLLBACK;

DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments
ORDER BY dept_no;
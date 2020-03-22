DROP TABLE IF EXISTS employees_dup;

CREATE TABLE employees_dup (
    emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    gender ENUM('M', 'F'),
    hire_date DATE
);

INSERT INTO employees_dup
SELECT e.*
FROM employees e
LIMIT 20;

SELECT 
    *
FROM
    employees_dup;
    
INSERT INTO employees_dup VALUES
('10001', '1953-09-02', 'Gerogi', 'Facello', 'M', '1986-06-26');

/*
the SQL UNION ALL operator is used to combine a few SELECT statements in a single output
it can think of it as a tool that allows you to unify tables
the syntax is SELECT N COLUMNS FROM table_1 UNION ALL SELECT N COLUMNS FROM table_2;
we have to select the same number of columns from each table
these columns should have the same name, should be in the same order, and should contain related data types
*/

/*
to the dept_manager table we will try to attach the duplicate rows from only employees_dup table
but the dept_manager and employees_dup column are not the same
in order to fix this problem, it need to add all missing columns
*/

# UNION ALL

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;
    
# UNION

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;
    
/*
first, when uniting two identically organized tables, UNION displays only distinct values in the output
UNION ALL retrieves the duplicates as well
second, because UNION requires SQL to conduct one additional operation, clearing the result set from duplicates
it uses more MySQL resources, in other words more computational power and storage space are required to execute a UNION operation
if want to get the better results, use UNION
if want to seeking to optimize performace, use UNION ALL
*/

# - modifies DESC and turns it into ASC

SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY -a.emp_no DESC;

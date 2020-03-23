/*
some query can be executed within a SELECT statement or with a FROM clause not just with WHERE clause
this means they can be placed pretty much anywhere in a query
*/

/*
assign employee number 110022 as a manager to all employees from 10001 to 10020, and employee number 110039 as a manager to all employees from 10021 to 10040
subset A it will be the group of the first 20 employees associated with manager 110022
subset B is will be the group of the employees assigned to manager 110039
the unification between the two subsets will be made through a UNION and a tables from which we will extracting data will be employees and dept_manager
the outcome will be the table with emp_ID, dept_code, manager_ID
in addition, all emp_ID will be smaller than 110022, and smaller than 110039
*/

# the innermost query, this will select the emp_no 110022 from the dept_manager table

SELECT 
    emp_no
FROM
    dept_manager
WHERE
    emp_no = 110022;
    
# add this inner query to the SELECT statement of an outer query
# take the min value because more than 1 department could be associated with an employee and by using min, we will ensure we place only one value corresponding to an employee number
# the JOIN block, is joining the employees in the dept_manager table WHERE no employee number is >= 10020

SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS emp_ID,
            MIN(dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS emp_ID,
            MIN(dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B;
    
    DROP TABLE IF EXISTS emp_manager;
    
    CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);


INSERT INTO emp_manager
SELECT U.*
FROM(
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS emp_ID,
            MIN(dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS emp_ID,
            MIN(dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B
    UNION SELECT 
    c.*
    FROM
    (SELECT
    e.emp_no AS emp_ID,
            MIN(dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS C
    UNION SELECT
    D.*
    FROM
    (SELECT
    e.emp_no AS emp_ID,
            MIN(dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS D) AS U;


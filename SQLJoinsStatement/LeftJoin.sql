/*
LEFT JOIN is allows us to see all records from the table on the left side of the join including all matching rows of two tables
in SQL this translates in retriebing all matching values of the two tables plus all values from the left table that match no values from the right table
*/

/*
remove duplicate record from the table
the SQL will delete all initial records and all their duplicates
*/

DELETE FROM dept_manager_dup 
WHERE
    emp_no = '110228';
    
DELETE FROM departments_dup 
WHERE
    dept_no = 'd009';

/*
because it will remove initial records
so it need to be added back the initial records
*/

INSERT INTO dept_manager_dup 
VALUES('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_dup 
VALUES('d009', 'Customer Service');

/*
LEFT JOIN
it more 6 records than the INNER JOIN
because this 6 records are represent the area filled with the left table
in other words, this is the part of the left set where no values match with the right table
the dept_no d002 are show in the output list, because this records are in the left table, but there is no corresponding dept_name
because there is no record in the departments_dup table(right table)
having the dept_manager_dup and departments_dup on the left can change the results completely
*/

SELECT 
    m.dept_no, m.emp_no, d.dept_no
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

/*
the order in which you join tables in SQL matters
on the top example, the left table is dept_manager_dup, the right table is departments_dup
on the below example, the left table is departments_dup, the right table is dept_manager_dup
the result are completely different, this is due to swapping the direction of the two tables
the correct way to do that, is to retrieve the first selection from the first table you have set in the JOIN syntax
LEFT JOIN falls in this category since in the output obtained you have data from the outer part of the venn diagram, in this case it can also use the keyword LEFT OUTER JOIN, and will extract an identical result
LEFT JOIN and LEFT OUTER JOIN are two interchangerable phrases
there is no reason type the OUTER, because if using a LEFT JOIN, it will always be an outer type of join, this is like omitting the word INNER from INNER JOIN
LEFT JOIN can deliver a list with all records from the left table that do not match any rows from the right table
*/

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

# extract only the dept_name IS NULL

SELECT 
    m.dept_no, m.emp_no, d.dept_no
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    dept_name IS NULL
ORDER BY m.dept_no;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no;

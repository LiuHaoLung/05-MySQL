/*
the syntax is INSERT INTO table_2(column_1, column_2, ..., column_n) SELECT column_1, column_2, ..., column_n FROM table_1 WHERE conditions;
to retrieve the information from the table_1 and inserted to the table_2
it doesn't have to be entire table from that other table
by using WHERE you should be able to set conditions that would refine the data to be copied
*/

SELECT 
    *
FROM
    departments
LIMIT 10;

# the task it to import all the data from departments into departments_dup

CREATE TABLE departments_dup
(
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

# check the table

SELECT 
    *
FROM
    departments_dup;
/*
since the departments contains the same number and typr of columns
it is not necessary to add specific conditions to the data retrieved from that table
*/
    
INSERT INTO departments_dup
(
	dept_no,
    dept_name
)
SELECT *
FROM departments;

# unless the new data you are inserting satisfies the constraints that have already been set in the database, if not, SQL will always show an error

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

INSERT INTO departments
values
(
	'd010',
    'Business Analysis'
);
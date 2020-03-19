/*
duplicate records also knows an duplicate rows, are identical rows in the SQL table
this means for a pair of duplicate records the values in each column coincide
generally duplicate rows are not always allowed in a database or a data table
however they are sometimes encountered, especially in new, raw or uncontrolled data
*/

# to fix when using GROUP BY will appear the ERROR 1055

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

# insert duplicate record into the dept_manager_dup

INSERT INTO dept_manager_dup
VALUES('110228', 'd003', '1992-03-21', '9999-01-01');

# insert duplicate record into the departments_dup

INSERT INTO departments_dup
VALUES('d009', 'Customer Service');

SELECT
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

/*
inner join again
the emp_no 110228 add more than 1 records(total 1 records)
the dept_no d009 all add more than 1 records(total 4 records)
so with the duplicate records, the inner join add other 5 records, so there are 25 records
to solve the duplicate situation, use the GROUP BY to get the unique records
you cannot allow yourself to assume there are no duplicate rows in the data
it would be ggod to get used to grouping the joins by the field that differs most among the records
*/

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY dept_no;



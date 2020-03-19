/*
can join tables with columns of the same type and having the same meaning
so the related column of these two tables will be the dept_no
the inner join represent all records belonging to both departments_dup and detp_manager_dup tables
this area is called result set, the inner join can help us extract this result set
 with this type of join, we can match records of two or more tables
 the same values appearing in the departments_dup and dept_manager_dup are the matching values also called matching records
 so the values that don't match will not appear in the final output, logically they are called non-matching values or non-matching records
*/

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
the syntax is SELECT table_1(t1).column_name(s), ..., table_2(t2).column_name(s), ..., FROM table_1 t1 JOIN table_2 t2 ON table_1(t1).column_name = table_2(t2).column_name;
in the SELECT statement, it is important to designate the tables the columns belong to because the data is not in a single table
the t1 and t2 use the AS to rename the table, and it is usually added right after the original table name without using the keyword AS
m means dept_manager_dup and d means departments_dup
the relating columns of the two tables need not be named in the same way
obtained this column from the dept_manager_dup table, so it will sort the information in the ORDER BY clause by the dept_no from the dept_manager_dup
*/

/*
the results don't have the d001, d002, d010, d011 and NULL
INNER JOIN extract only records in which the values in the related columns match
NULL values, or values appearing in just one of the two tables and not appearing in the other, are not displayed
*/

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, dm.dept_no
FROM
    employees e
        INNER JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;

/*
few notes on using JOINS not just INNER JOIN but any types of JOINS
can add any combination of columns we'd like in the output, the only condition is that each column must be part of one of the JOIN tables
the INNER is not obligatory, it could be omitted in this query whether you type INNER JOIN or kust JOIN, it makes no difference
the clause on the ON, m.dept_no = d.dept_no or d.dept_no = m.dept_no, there is no difference, it is up to you
the ORDER BY dept_no, no matter m.dept_no, d.dept_no, dept_noi, they are can also still work
*/





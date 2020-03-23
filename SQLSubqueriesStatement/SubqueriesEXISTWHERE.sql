/*
the EXISTS operator checks whether certain row values are found within a subquery
this check is conducted row by row, and it return a boolean value
if a row value of a subquery exists, the operator returns TRUE, and the corresponding record of the outer query is extracted
if a row value of a subquery doesn't exist, the operator returns FALSE, and no row values from the outer query is extracted
*/

/*
the EXISTS and IN operator resemble each other when applied to subqueries
EXISTS tests row values for existence, IN searches among values
hence EXISTS is quicker in retrieving large amounts of data, IN is faster with smaller datasets
*/

# it will deliver all first_name and last_name of the people in the employees table who are also found in the dept_manager table
# as a matter of fact, it will create a whole table not just a column as we did in IN operator

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);

# it can added the ORDER BY, and insert within the subquery
# the outer query will simply follow the order of the inner query

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no
        ORDER BY emp_no);
        
# however, it is more professional to apply ORDER BY in the outer query
# it is more acceptable logically to sort the final version of the dataset

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no)
ORDER BY emp_no;

/*
be aware, that some, though not all, neseed queries can be rewritten using JOINS, which are more efficient in general
this is true particularly for inner queries using the WHERE clause
although sometimes the same answer can be obtained with a JOIN, nested queries are considered an essential tool
on certain occasions, subqueries can be bad for performance concern, but they allow for better structuring of the outer query
thus each inner query can be thought of in isolation and organizing the extraction process can be improved
in some situation, the use of subqueries is much more intuitive compared to the use of complex JOINS and UNIONS
finally, many users prefer subqueries simply because they offer enhanced code readability
*/

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer');
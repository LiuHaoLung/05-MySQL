/*
Subqueries are queries embedded in a query
they also called inner query or nested queries, alternative names are inner select
they are part of another query, called an outer query, alternative names are outer select
most ofteh subqueries is employed in the WHERE clause of a SELECT
*/

# the database in perfect condition, this 24 rows must be registered in the employees table

SELECT 
    *
FROM
    dept_manager;

/*
select the first_name and last_name from the employees table
for the same emp_no that can be found in the dept_manager table
the last condition has been set through the WHERE clause in the IN operator
it will list all employee numbers recorded in the dept_manager table
*/    

/*
the outer query is the entire code, starting from SELECT first_name, last_name and so on until the IN operator
the subquery or the inner query that is nested within the outer query, this is the SELECT dm.emp_no
the subquery should always be placed within parentheses
*/

/*
from a processing of view, the SQL engine starts by running the inner query
then it uses its returned output, which is intermediate, to execute the outer quert
in general, a subquery may return a single value, a scalar, a single row, a single column or an entire table
it can have a lot more one subquery in the outer query, it is possible to nest inner queires within other inner queries
in this case, the SQL engine would execute the innermost query first, and then each subsequent query, until it runs the outermost query last
*/
    
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
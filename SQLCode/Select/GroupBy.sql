/*
when working in SQL, the result can be grouped according to a specific field or fields
technically this is done by using the GROUP BY clause, which must by placed immediately after the WHERE conditions, if any, and just before the ORDER BY clause
the syntax is SELECT column_name(s) FROM table_name WHERE conditions GROUP BY column_name(s) ORDER BY column_name(s);
*/

# it will obtain the unsorted list of the names

SELECT 
    first_name
FROM
    employees;
    
/*
the result will be shorter, as only distinct values will be selected
if a value within the first_name field appears in the table more than once, by using GROUP BY, it will be displayed only in a single row
practically speaking, this is the same as if we use the well-known SELECT DISTINCT
the only thing difference is this time the selected rows were sorted in a different way
in addition, GROUP BY was slower than SELECT DISTINCT
knowing to use a GROUP BY statement whenever you have aggregate functions is essential, in most cases when you need a aggregate function, you must add a GROUP BY clause in the query
*/

SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

/*
always include the field you have grouped your results by in the SELECT statement
if it don't include the column in the SELECT statement, it will be impossible to execute the quey
include the column in the SELECT statement, it also improves the organization and readability
*/

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name;
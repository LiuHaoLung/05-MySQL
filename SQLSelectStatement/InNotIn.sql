/*
the IN operator allows SQL to return the names written in parentheses, if they exist in the table
use the IN structure was quicker than the OR structure
overall when many conditions are to be applied in a query, the IN operator is preferred
if use the NOT IN, the output doesn't contain any of there condition
because the database contains an extensive list of records
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name IN('Cathie', 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
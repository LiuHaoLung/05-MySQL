/*
ROUND(#,decimal_places) is a numeric or math function you can use
it is usually applied to the single values that aggregate functions return
ROUND embraces its argument which is the number that must be rounded, and it can be located anywhere in the query
as long as the numeric valus has been provided within the parentheses
*/

SELECT 
    ROUND(AVG(salary),2) AS average_salary
FROM
    salaries;
    
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
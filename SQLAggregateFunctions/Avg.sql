/*
AVG is extracts the average value of all non-null in a field
aggregate functions can be applied to any group of data values within a certain column
so it is frequently used together with a GROUP BY clause
*/

SELECT 
    AVG(salary) AS average_salary
FROM
    salaries;
    
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date = '1997-01-01';
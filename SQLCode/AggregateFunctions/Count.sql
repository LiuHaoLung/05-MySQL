/*
aggregate functions are gather data from rows of a table, then aggregate it into a single value
this means the information contained in multiple rows will be the input of these functions and the single value they provide is the respective output
COUNT, SUM, MIN, MAX, AVG, these function can return a single value from an entire column, another way to refer to aggregate functions is as summarizing functions
these functions are response to the infromation requirements of a company's different organizational levels
top management executive are typically interested in summarized figures and rarely in detailed data
so the aggregate function is the perfect solution
*/

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

/*
the name of the column salary acts as an argument of the COUNT function
COUNT can applicable to both numeric and non-numeric data
*/

SELECT 
    COUNT(salary)
FROM
    salaries;
    
# COUNT(DISTINCE ) helps us find the number of times unique values are encountered in a given column

SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;
    
/*
aggregate functions typically ignore null values throughout the field to which they are applied
actually this can happen only if you have indicated a specific column name within the parentheses
the alternaive option you can choose is typing COUNT(*), not the keyword DISTINCT
use this feature, it can returns the number of all rows of the table, null values included
the parentheses and the argument must be attached to the name of aggregate function
in other words you shouldn't leave the whitespace before opening the parentheses
*/

SELECT 
    COUNT(*)
FROM
    salaries;
    
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;

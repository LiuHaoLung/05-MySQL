/*
aggregate functions, they are applied on multiple rows of a singel column of a table, and return an output of a single value
COUNT, it counts the number of non-null records in a field, it is frequently used in combination with the reserved word DISTINCT
SUM, it sum all the non-null values in a column
MIN, it returns the minimum value from the entire list
MAX, it returns the maximum value from the entire list
AVG, it calculates the average of all non-null values belonging to a certain column of a table
the aggregate functions ignore null values unless told not to
*/

# the parentheses after COUNT must start right after the keyword not after a whitespace
# when the contents in parentheses is tightly related to the function designated by the preceding reserved word, no whitespace must be used
# the count delivered the total number of values in the specified field

SELECT 
    COUNT(emp_no)
FROM
    employees;

SELECT 
    COUNT(first_name)
FROM
    employees;

# COUNT(DISTINCT) it supposed to deliver the number of different names found throughout the data table
# the DISTINCT is not placed after SELECT, it placed written within the parentheses before the column names

SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;

SELECT 
    COUNT(*)
FROM
    dept_manager;
    
    
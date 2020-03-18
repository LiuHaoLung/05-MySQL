/*
ORDER BY can reorder the records and get the desired outcome
one of two specified reserved words can be attached at the end of the ORDER BY
ASC, abbreviated for ascending, require the output to be sorted by the values in the designated field in the ascending order
write the ASC at the end or not, the output will be the same
DESC, abbreviated for descending, hence if you would like the results plotted in reverse order, DESC is the keyword
ORDER BY doesn't work for columns containing string values only
the ORDER BY can handle numbers as well
it can order by more than one field
*/

SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;
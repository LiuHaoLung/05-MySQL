/*
WHERE allow us to set condition that refer to subsets of individual rows
these conditions are applied before reorganizing the output into groups
once the rows that satisfy the WHERE conditions are chosen, they progress in the data retrieval process and can be grouped by distinct values records in a certain field or fields
it is not until this moment when the output can be further improved or filtered with a condition specified in the having class
finally you could sort the records of the final list through the ORDER BY clause
to sum up, if need to use with aggregate functions use GROUP BY and HAVING
if need to apply general conditions use WHERE
*/

# extract a list of all names that are encountered less than 200 times, let the data refer to people hired aftet the 1st of January 1999
# HAVING can not have both an aggregated and non-aggregated

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;
/*
Having is a clause frequently implemented with GROUP BY
it is refines the output from records that don't satisfy a certain condition
the syntax is SELECT column_name(s) FROM table_name WHERE conditions GROUP BY column_name(s) HAVING conditions ORDER BY column_name(s);
HAVING needs to be inserted between the GROUP BY and ORDER BY clauses
in addition HAVING is like WHERE but applied to the GROUP BY block
the main distinction between the two clauses is that HAVING can be applied for subsets of aggregated groups while in the block this is forbidden
in other words, after HAVING, you can have a condition with an aggregate function, while WHERE cannot use aggregate functions within its conditions
if the function is any aggregate function, it need to use the HAVING not WHERE
*/

SELECT 
    *
FROM
    employees
HAVING hire_date >= '2000-01-01';

# try to run this query will give the error message, the invaild use of group function

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    COUNT(first_name) > 250
GROUP BY first_name
ORDER BY first_name;

# the HAVING statement need to place after the GROUP BY statement

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

SELECT 
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no;

SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

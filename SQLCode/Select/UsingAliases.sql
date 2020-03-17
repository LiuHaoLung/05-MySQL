/*
the second column in the output is called COUNT(first_name)
first it is not professional to leave the function keyword in the column names of the output
second it would be much better to see a name that explains the reasoning behind using this aggregate function
both problem can be solved using ALIASES
ALIAS is used to rename a selection from the query
in this example, the first selection is first_name, the other selection is COUNT(first_name)
use the AS can rename the column name and it is not actually change the output
but this technique is constantly being applied in queries as it clarifies the analysis undertaken
*/

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;
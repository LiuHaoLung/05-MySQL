/*
IS NOT NULL, it will be used to extract values that are not null
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
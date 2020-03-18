/*
in SQL will be able to use the same science as the ones we usually use
=        means equal to
>        means greater than
>=       means greater than or equal to
<        means less than
<=       means less than or equal to
<> , !=  means not equal, also called the different from sign
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Mark';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name != 'Mark';

# in this query, the 2000-01-01 will excluded from the retrieve data    
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';

# if want to included the 2000-01-01, it must use the >=    
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

SELECT 
    *
FROM
    employees
WHERE
    hire_date < '1985-02-01';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date <= '1985-02-01';

SELECT 
    *
FROM
    employees
WHERE
    GENDER = 'F'
        AND hire_date > '2000-01-01';
        
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
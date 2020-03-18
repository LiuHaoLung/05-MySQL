/*
sometimes you will need to look for a specific pattern in a column
for example, you would like to extract a list of all people whose first name begins with Mar
such names include Mark, Martin, Margaret and so on
to obtain the desired output after the WHERE clause, you must as usual indicate the field
the % sign can be seen as a substitute for a sequence of characters
it represents 0 or more letters that exceed those indicated before it
the _ helps to match a single character
NOT LIKE exact opposite operation will be carried out
MySQL is case insensitive
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('ar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('MAR_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('MARK%');

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
/*
OR will contain a combination of the records of the two outputs
in the example, the first_name will be scrambled, they are ordered differently following the employee number

therefore it can conclude that 
use AND with the conditions set on different columns
use OR with the conditions set on same columns
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';

/*
if use the AND operator, the SQL return nothing
because SQL unable to find the person named both Denis and Elvis at the same time
*/
        
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        AND first_name = 'Elvis';
        
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
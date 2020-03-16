/*
the logical order with which you must comply when you use both operators in the same WHERE block
logical operator precedence, an SQL rule starting that in the execution of the query
the operator AND is applied first, while the operator OR is applied second
regardless of the order in which you use these operators, SQL will always start by rading the conditions around the AND operator
*/


/*
because the way conditions and operators are structured in this code
it turns out we have extracted all male individuals with the last named Denis and all female individuals in data table regardless of their family name
to circumvent this issue, parentheses can help restructure the logic of operation
*/

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND (GENDER = 'M' OR GENDER = 'F');

SELECT 
    *
FROM
    employees
WHERE
    GENDER = 'F'
        AND (first_name = 'kellie'
        OR first_name = 'Aruna');
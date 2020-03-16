/*
the technical term for the = sign is equal operator
in SQL, there are many other linking and symbols, called operators, that you can use with the WHERE clause
like AND, OR, IN, NOT IN, LIKE, NOT LIKE, BETWEEN ... AND...
EXISTS, NOT EXISTS, IS NULL, IS NOT NULL, comparison operators and so on
AND is an operator that allows you to logically combine two statements in the condition code block
for instance, it can retrieve data about all employees whose first_name is Denis and who are male
so the AND operator allows us to narrow the output we would like to extract from the data
technically this operator must be placed right after the first condition
aAND binds SQL to meet both conditions enlisted in the WHERE clause simultaneously
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND GENDER = 'M';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND GENDER = 'F';
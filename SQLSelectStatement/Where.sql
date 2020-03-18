/*
the WHERE clause, it will allow us to set a condition upon
which will specify what part of the data we want to retrieve from the database
in the SELECT syntax is SELECT column_1, column_2,... FROM table_name;
add the WHERE statement, the syntax become SELECT column_1, column_2,... FROM table_name WHERE condition;
this condition can be for example verification that certain information is availale, a check or a mathematical
don't forget to add a single or double quotes to the string
in SQL the = isn't used for mathematical expressions only
in this line of code, it means the selection of data will be based on the condition that the individual's name is 'Denis'
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
SELECT 
    SUM(salary)
FROM
    salaries;
/*
it will raise a syntax error
the * feature goes well with only the COUNT function, it doesn't work with other aggregate functions
except the COUNT, the other aggregate functions can only work with numberic data
*/

SELECT 
    SUM(*)
FROM
    salaries;
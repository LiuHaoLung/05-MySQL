/*
the SELECT statement can retrieve rows from a designated column, given some criteria
what if there are duplicate values contained in this field, the SELECT can extract them all
SELECT DISTINCE is selects all distinct, different data values
the syntax is SELECT DISTINCE column_1, column_2 ... FROM table_name;
*/

# the all value are showing, measn all the gender will show up

SELECT 
    gender
FROM
    employees;

# the different data values are showing, only Male and Female will show up

SELECT DISTINCT
    gender
FROM
    employees;
    
SELECT DISTINCT
    hire_date
FROM
    employees;


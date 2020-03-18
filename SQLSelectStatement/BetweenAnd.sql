/*
the BETWEEN AND helps us designate the interval to which a given value belongs
that's why it is always used in combination with the AND operator
in the below example, both 1991-01-01 and 2000-01-01 will be included in the retrieved list of records
the NOT BETWEEN AND will refer to an interval composed of two parts
an interval below the first value indicated
and a second interval above the second value
in the below example, both 1991-01-01 and 2000-01-01 will be not included in the retrieved list of records
the BETWEEN is not used only for date values, it can also be applied to strings and numbers
*/

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1991-01-01' AND '2000-01-01';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1991-01-01' AND '2000-01-01';
    
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 700000;
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
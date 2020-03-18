/*
the UPDATE statement is used to update the values of existing records in a table
the syntax is UPDATE table_name SET column_1 = value_1, column_2 = value_2 ... WHERE conditions;
by execute this syntax, the SQL will change the record or records satisfying the WHERE condition
updating the old values of the columns listed with the new ones
if don't provide the WHERE condition, all rows of the table will be updated
*/

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
# we do not have to update each value of the record, in the other word we have updated the specific record
    
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;
    
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

/*
it will save the data set as we see it
once you execute COMMIT, you can not reverse any change
*/

COMMIT;

/*
it will modify all rows of the data table
typically happen by mistake, when the WHERE clause and the accompanying conditions have not been added
*/

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';

# it will take us to the lase commit that has been run or if we have not run a commit command beforehand, it will take us to the beginning of the entire SQL code

ROLLBACK;

/*
after execute the ROLLBACK;
the information in the departments_dup table is the same as the beginning
*/

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments
ORDER BY dept_no;
# preset

DELETE FROM departments_dup 
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments_dup
    ORDER BY dept_no;
    
ALTER TABLE departments_dup 
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

# let the dept_name can null, so the dept_name is missing by attaching a null label

INSERT INTO departments_dup
(
	dept_no
) 
VALUES 
(
	'do10'
),
(
	'do11'
);

# add a new column called dept_manage and place it after the dept_name and the value can be null

ALTER TABLE departments_dup
ADD COLUMN dept_manage VARCHAR(255) NULL AFTER dept_name;

# sava the departments_dup current status

COMMIT;

/*
IFNULL() and COALESCE() is used when null values are dispersed in the data table and would like to substitute the null values with another value
IFNULL() can be employed within this select block and needs only two arguments within parentheses
the IFNULL(expression_1, expression_2), it can returns the first of the two indicated value if the data value found in the table is not null
returns the second value is there is a null value
and print the returned value in the column of the output
*/


/*
if the department_name is not null, it will see the initial data value
if the department_name is null, it will see the string 'Department name not provided'
*/

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;
    
/*
IFNULL() can not contain more than two paremeters
so this is where COALESCE() step in
the COALESCE(expression_1, expression_2, expression_3 ..., expression_n)
it allows you to insert N arguments in the parentheses
it can think of COALESCE() as IFNULL() with more than two parameters
by definition, COALESCE will always return a single value of the ones we have within parentheses
and this value will be the first non-null value of this list, reading the values from left to right
as result, if COALESCE() has 2 arguments, it will work precisely like IFNULL()
*/

SELECT 
    dept_no,
    COALESCE(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;
    
SELECT 
    *
FROM
    departments_dup
    ORDER BY dept_no;
    
/*
the function here points to the third column and it will contain three arguments
our idea is to see in each cell of the third column(dept_manage) the initial value of that cell if it is not null
to see the dept_name if it is null
and finally to see N/A if the second designated value dept_name is null
because all values in the third column are null, we should expect to have the second column replicated in place of the third one expect for the last couple of rows where we should have N/A
*/    

/*
the first column is null, it is the initial value of the dept_manage column, but the entire column was empty
so what does COALESCE do, it simply moves on until it finds a non-null value
therefore COALESCE to speak, skips the value of the first argument and proceeds to check the value of the second argument, it is the value of the dept_name field
the name of the dept_name of the first record is Marketing, so COALESCE stops here and say here is a non-null value of one of my arguments
this is the one I am going to display, this why marketing is displayed as a value in the third column
IFNULL() and COALESCE() do not make any changes to the data set
they merely create an output where certain data values appear in place of NULL values
*/

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manage, dept_name, 'N/A') AS dept_manage
FROM
    departments_dup
ORDER BY dept_no;

/*
use COALESCE(), we can have a single argument in a given function, COALESCE(expression_1)
the value indicated as an argument will be displayed
in this case, COALESCE() was used to show one additional column and the output
in this situation, we saw how the department manager name appears in all records of the fake_col
this way if you are still building the table and perhaps the database, COALESCE() can help you visualize a prototype of the talbe's final version
thus consider whether to create a real column containing the department manager's name
this is carried out with COALESCE only, if it apply to the IFNULL() the SQL will show error
*/

SELECT 
    dept_no,
    dept_name,
    COALESCE('department manager name') AS fake_col
FROM
    departments_dup;
    
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no;

/*
the INSERT syntax INSERT INTO table_name(column_1, column_2, column_n) VALUES(value_1, value_2, value_n);
the column is not for all, it can designate only those in which you would like to inset data
*/

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

/*
when data is being created to test the database system, the value inserted should be quite high
integer can have the quotes too, the SQL will automatically or transparently convert the string into an integer
but it is not considered a best practice
please remember to type integers as plain numbers, without using quotes
the INSERT columns order can change, so it must put the value in the exact order we have listed the column names
*/

INSERT INTO employees
(
	emp_no, 
	birth_date, 
	first_name, 
	last_name, 
	gender, 
	hire_date
) 
VALUES(
	999901, 
	'1986-04-21', 
	'John', 
	'Smith', 
	'M', 
	'2011-01-11'
);

/*
technically the first pair of parentheses along with the column names between them can be omitted
only INSERT INTO table_name and VALUES parts are mandatory
if you omitted, in the values section you will have to specify as many data values as there are columns in the data table
furthermore you will have to add them in the same order in which they appear in the table
the below example, the data insert to the table without the columns section
*/

INSERT INTO employees
VALUES
(
	999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);

INSERT INTO titles
(
	emp_no,
    title,
    from_date
)
Values
(
	999903,
    'Senior Engineer',
    '1997-10-01'
);

SELECT 
    *
FROM
    titles
LIMIT 10;

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;

INSERT INTO dept_emp 
VALUES
(
	999903,
    'd005',
    '1997-10-01',
    '9999-01-01'
);

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC;
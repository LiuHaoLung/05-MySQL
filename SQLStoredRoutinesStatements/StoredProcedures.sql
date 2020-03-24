/*
the ;, they function as a statement terminator, technically, they can also be called delimiters
by typing DELIMIRER $$, you'll be able to use the dollar symbols as your delimiters, so the ; isn't a delimiter anymore
query 1; query 2; call stored-procedure_1; p_query 1; p_query_2; query 3; ..., the SQL will execute the first procedures, then it is not going to read the code after the first procedures semicolon
in order to avoid this problem, you need a temporary delimiter different from the standard semicolon
they are various symbols you can use, $$ or //, it doesn't really matter which one you choose
*/

/*
it must write CREATE PROCEDURE and attach the name we would like to assign to in
next to the name, it must always (), they are inherent to the syntax for creating a procedure, because within these (), you would typically insert parameters
parameters represent certain values that the procedure will use to complete the calculation it is supposed to execute
a procedure can be created without parameters too, nevertheless the () must always be attached to its name, otherwise, MySQL will display an error message
*/

/*
the body of procedure, it is always in close between BEGIN and END, and the temporary delimiters which is $$
the body of procedure is composed of a query and this query is the reason you are creating the entire procedure in the first place, it will be placed between the BEGIN and END keywords
moreover, at the end of this query will have the usual delimiter the semicolon not $$
if we use the delimiter again, the creation of the procedure will stop here again, and MySQL will show an error
finally don't forget to reset the delimiter to the classical semicolon symbol
if you forget to do that, you risk making the opposite mistake, not run any of the codes exceeding the line where you are calling the procedure
from this moment on the $$ will not act as a delimiter
*/

USE employees;

# when dropping a nonparemeterized procedure we shouldn't write the parentheses at the end

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
SELECT 
    *
FROM
    employees
LIMIT 1000;
END$$
DELIMITER ;

# first, the () instead indicate that the object is a stored routine

CALL employees.select_employees();

# second, we use the USE employees;, so it can skip the database name part and call the procedure name directly

CALL select_employees();

# third, click the tiny lightning symbol


DELIMITER $$
CREATE PROCEDURE select_average_salary()
BEGIN
SELECT 
    AVG(salary)
FROM
    salaries;
END$$
DELIMITER ;

CALL select_average_salary();

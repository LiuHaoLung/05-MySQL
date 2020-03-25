/*
sometimes will use functions
when use the functions, there will no out parameters to define between the () after the object's name
all parameters are IN, and since this is well known, you need not explicitly indicate it with the word IN
so writing the parameters name and its data type is enough, although there are not out parameters, there is a return value, it is obtained after running the query in the body of the functions, it can be any data type
*/

USE employees;

DROP FUNCTION IF EXISTS f_emp_avg_salary;

/*
apatr from specifying the functions name, we will need to add () and indicate a parameter that will be within these ()
then instead of designating an out parameter, the keyword returns must be written outside the ()
after we should not indicate an objet name but a data type instead, this indeed the data type of the return value that will come from the calculation
the variable not with the SET keyword but the DECLARE, because this is the word used to create variables visible to the body of the object they belong to 
this variable data type must coincide with the oine specified in the CREATE FUNCTION statement
in the body query, we have a RETURN statement which merely returns the v_avg_salary value
if you omit this line from the function's body, MySQL will display an error
because conceptually we would not have satisfied the requirement to set a RETURN value when creating a function
*/

/*
when show the error 1418, it need to add some of this characteristics after the CREATE FUNCTION
DETERMINISTIC means it states that the function will always return identical result given the same input
NO SQL means that the code in our function does not contain SQL (rarely the case)
READ SQL DATA means this is usually when a simple SELECT statement is present
*/

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
    
RETURN v_avg_salary;
END $$
DELIMITER ;

# execute functions, without the CALL statement

SELECT f_emp_avg_salary(11300);


DELIMITER $$
CREATE FUNCTION f_emp_info(p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL(10,2);

SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;

SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
        
RETURN v_salary;
END $$
DELIMITER ;

SELECT f_emp_info('Aruna','Journel');
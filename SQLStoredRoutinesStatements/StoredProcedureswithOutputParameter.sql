/*
in cases SELECT statement is used in their body, their output will be displayed to the user readily and they will be able to treat the result as they like
if the outcome is supposed to be stored in another variable that can be recorded in the database, and that can be used in outside applications, a second parameter must be defined within the parentheses, this parameter will be called an out parameter
it will represent the variable containing the output value of the operation executed by the query of the stored procedure
it must insert the AVG(salary) value into the out parameter just declared
everytime you create a procedure containing both an IN and OUT parameter, it must use the SELECT-INTO structure
*/


DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN
SELECT 
    AVG(salary)
INTO p_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END $$
DELIMITER ;

# if the first_name and last_name is not unique, the result will arise the error message

DELIMITER $$
CREATE PROCEDURE emp_info(IN p_first_name VARCHAR(255), IN p_last_name VARCHAR(255), OUT p_emp_no INTEGER)
BEGIN
SELECT 
    e.emp_no
INTO p_emp_no FROM
    employees e
WHERE
    e.first_name = P_first_name
        AND e.last_name = p_last_name;
END $$
DELIMITER ;
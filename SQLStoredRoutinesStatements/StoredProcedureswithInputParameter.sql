/*
a stored routine can perfrom a calculation that transform an input value in an output value
stored routine can take an input value and then use it in the query, or queries, written in the body of the procedure
this value is typically from the database you are working with, and this value is represented by th IN parameter
after that calculation is ready, a result will be returned
*/

/*
you want to have a program that returns the frist_name, last_name, salary, from_date, to_date of a specific employee
p stands for parameter
as a matter of fact, the WHERE clause checks if the value of the emp_no column from the employees table coincides with the IN parameter
it is very important to remember this last step, which defines how your input value will correspond to the five columns you have selected
procedure with one input parameter can be used with aggregate functions too
*/

DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
    e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END $$
DELIMITER ;

# with aggregate function

DELIMITER $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
    e.first_name, e.last_name, AVG(s.salary)
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END $$
DELIMITER ;

CALL emp_avg_salary(11300);
/*
the parameter and variables, the two programming mean different things
when you are defining a program, such as a stored procedure for instance, you can say you are using parameters, so parameters are a more abstract term
once the structure has beem solidified, then it will be applied to the database, the input value you insert is typically referred to as the argument, while the obtained value is stored in a variable
the name derives from the fact that its content may vary depending on the input value used for the calculation
*/

# we must create a variable, SET is the SQL keyword, must we must attach @ sign at the beginning of the variables name, and v means variables

SET @v_avg_salary = 0;

/*
the next step is extract a value that will be assigned to the newly created variable (call the procedure)
in the first position within the (), we will have to indicate a precise number that the procedure can use for its calculation)
in the secode position, we will have designate the place where the output value can be stored
third, we must ask the software to display the output of the procedure by selecting the variable just created
*/

CALL emp_avg_salary_out(11300, @v_avg_salary);

# obtained a number corresponding to the average salary of the emp_no

SELECT @v_avg_salary;

SET @v_emp_no = 0;
CALL emp_info('Aruna','Journel',@v_emp_no);
SELECT @v_emp_no;


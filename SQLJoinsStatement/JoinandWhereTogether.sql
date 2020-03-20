/*
the WHERE clause is not used for connecting the employees and salaries tables, this done by the JOIN clause
instead WHERE is used to define the condition or conditions that will determine which will be the connecting points between the two tables
example, want to see a table containing the emp_no, first_name, last_name of individuals whose annual remuneration has been more than 145000
to achive this goal, it will need information from two tables, employees and salaries table
then we can join the two tables by connecting them through the emp_no data
in this example, based on which conditions do we want to extract data, it will based on annual salary greater than 145000
*/

SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    salary > 145000;

SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
ORDER BY e.emp_no;


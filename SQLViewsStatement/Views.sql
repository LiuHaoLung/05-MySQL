/*
SQL VIEW is a virtual table whose contents are obtained from an existing table or tables, called base tables
the retrieval happens through an SQL statement, incorporated into the view
think of a view object as a view into the base table
the view itself doesn't contain any real data, the data is physically stored in the base table
the view simply shows the data contained in the base table
*/

SELECT 
    *
FROM
    dept_emp;
    
SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM
    dept_emp
GROUP BY emp_no
HAVING Num > 1;

/*
imagine you wanted to see a tabular output with the number of each employees shown only once having aside their latest starting and ending date
in other words you would like to visualize only the period encompassing the last contract of each employee
*/

# CREATE VIEW could suffice but the OR REPLACE fragment ascertain that the code we are about to write will be executed even if we already have a VIEW with the same name

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;

/*
imagine your database is used by a large web application being accessed by many users
if you would like to allow each user to see this table instead of typing and running the SQL starement that extracts the required information everytime a request from a user appears
the view can allow each user to see the result set on their user space
the view act as a shortcut for writing the same SELECT statement every time a new request has been made
thus it saves a lot coding time, moreover because it is written only once, the view occupies no extra memory
finally, the view acts as a dynamic table because it instantly reflects data and structural changes in the base table
the view are not real physical datasets, meaning we cannot insert or update the information that has already been extracted
they should be seen as temporary virtual data tables retrieving information from base tables
*/

CREATE OR REPLACE VIEW v_manager_average_salary AS
    SELECT 
        ROUND(AVG(salary), 2)
    FROM
        salaries s
            JOIN
        dept_manager m ON s.emp_no = m.emp_no;


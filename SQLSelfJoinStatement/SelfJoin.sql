/*
SELF JOIN is applied when a table must JOIN itself, this is not a rare event
if you'd like to combine certain rows of a table with other rows of the same table, you need a SELF JOIN
in a SELF JOIN statement, you will have to comply with the same logical and syntactic structure
however, the two tables will be identical to the table you'll be using in the SELF JOIN
it can think of them as virtual projections of the underlying, base table
the SELF JOIN will reference both implied tables and will treat them as two separate tables in its operations
furthermore, the data used will not come from two sources, but from a single source which is the underlying table that stores data physically
when we joined separate tables using AS was at the discretion, here using AS is obligatory, only they can help us distinguish the two virtual tables
these refrences to the original table let you use different blocks of the available data
it can either filter both in the JOIN or it can filter one of them in the WHERE clause and the other one in the JOIN
*/

# from the emp_manager table, extract the record data only of those employees who are managers as well

SELECT 
    *
FROM
    emp_manager
ORDER BY emp_no;

/*
join the same table to itself, providing different AS for each virtual table
the connection is made with different columns of the base table
everytime a connection between two implied tables is establish, all data of the corresponding row of the left table is displayed
whenever we have 110022 in the second table, only column data from first table is being recorded in a new table
this means the manager number column information is not taken from e2, then the same process is repeated for the other manager number 110039
*/

SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;

SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);



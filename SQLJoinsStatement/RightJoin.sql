/*
RIGHT JOIN, or the RIGHT OUTER JOIN, this functionality is identical to LEFT JOIN, with the only difference that the direction of the operation is inverted
the dept_manager_dup was set to be on the left side, the departments_dup was placed on the right side
whether we run a RIGHT JOIN or a LEFT JOIN with an inverted tables order, we will obtain the same output
so the RIGHT JOIN are seldom applied in practice
when applying a RIGHT JOIN, all the records from the right table will be included in the result set
values from the left table, will be included only if their linking column contains a value coinciding, or matching, with a value from the linking column of the right table
*/

/*
first, if you hear the term linking column, it is the same sa matching column
in addition when talking aout relationships, LEFT and RIGHT JOINS are perfect examples of one-to-many relationships
*/

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

/*
the index of a table functions like the index of a book
data is taken from a column of the table and is stored in a certain order in a distinct place, called an index
the larger a database is, the slower the process of finding the record or records you need
in this situation, we can use an index that will increase the speed of searches related to a table
the syntax is CREATE INDEX index_name ON table_name(column_1, column_2...);
the () serve as to indicate the column names on which out search will be based
it will be speeded up and the data will be filtered in a quicker way
speaking technically the idea is to choose columns, so the search will be optimized
these must be fields from the data table you will search frequently
an index occupies memory space, and could be redundant unless it could contribute to a quicker search
therefore, for the smaller datasets, the cost of having an index might be higher than the benefits
however, for the large datasets, a well-optimized index can make a positive impact on the search process
*/

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
# through the index, the speed is quicker
    
CREATE INDEX i_hire_date ON employees(hire_date);

/*
composite indexes, they are applied to multiple column, not just a single one
the syntax is the same
carefully pick the columns that would optimize your search
then type the chosen column names in the () attached to the table name
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello';


# the optimizer works is following, first it will look up rows based on the data and first designated columns as if you are using single column index
# then based on the obtained intermediary output, it will proceed and search based on the second value

CREATE INDEX i_composite ON employees(first_name, last_name);


/*
there are another indexes in MySQL, primary and unique keys are MySQL indexes
they represent columns on which a person would typically base their search
this column represents unique values an analyst could take advantage of to extract distinct values from the data table
*/

# first is table, second is the database

SHOW INDEX FROM employees FROM employees;

ALTER TABLE employees DROP INDEX i_hire_date;

SELECT 
    *
FROM
    salaries
WHERE
    salary > 89000;
    
CREATE INDEX i_salary ON salaries(salary);
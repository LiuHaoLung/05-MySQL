/* 
select allows you to extract a fraction of the entire data set
it allows you to retrieve data from database objects, like tables
or this statement is used to query data from a database
the basic syntax is SELECT column_1, column_2,... FROM table_name;
pratically the FROM keyword is mandatory, it tell which table we will be retrieve data from
so when extracting information, SELECT goes with FROM
*/

SELECT 
    first_name, last_name
FROM
    employees;

/*
if interested all the information, there is a substitute for and listing all its columns between select from
in SQL, * technically defined as a wildcard character means all and everything
*/    

SELECT 
    *
FROM
    employees;
    
SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments;
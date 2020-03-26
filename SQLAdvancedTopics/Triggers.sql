USE employees;

/*
MySQL triggers is a type of stored program, and it is associated with table, that will be activated automatically, once a specific event related to the table of associations occurs
this event must be related to one of the three DML statements, INSERT, UPDATE or DELETE
therefore, it is a powerful tool that associated with the database consistency and integrity
moreover, to any of the DML statements, one of two types triggers can be assigned, before and after
in other words, the trigger is the SQL objects can trigger a specify action or calculation, before or after an INSERT, UPDATE and DELETE  statements has been executed
for instance, a trigger can be activated before a new record has been INSERT into a table, or after a record has been UPDATE
*/

# save the current database

COMMIT;

/*
after we stating CREATE a TRIGGER and then indicating its name, its type and the name of table to which it will be applied
in this case, we devised a BEFORE trigger, which will be activated whenever new data is INSERT into the salaries table
*/

/*
we creating a before trigger, FOR EACH ROW, it designates that befor the trigger is activated, MySQL will perfom a check for a change of the state of the data on all rows
a change in the data of salaries table will be caused by insertion of the record
*/

/*
the body of the IF statement, is the core of this trigger
it says if the salary is lower than 0, it will be set of 0
*/

/*
the NEW keyword, in general, it refers to a row that has been just inserted or updated
in this case, the NEW.salary, will refer to the value that will be inserted in the salary column of the salaries table
*/

/*
the SET keyword, it is used whenever a value has been assigned to a variable
in this case, the newly inserted salary and the value assigned is 0
*/

DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN 
		SET NEW.salary = 0; 
END IF;
END $$
DELIMITER ;

SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 10001;

# when we insert the salaries is lower than 0, because we set the before trigger, the insert salary will be 0

INSERT INTO salaries VALUES('10001', -92891, '2010-06-22', '9999-01-01');

# it is a BEFORE UPDATE TRIGGER

/*
instead setting the new value to 0, it basically tell MySQL to keep the old value
so the syntax is SET NEW.salary = OLD.salary;
*/

DELIMITER $$

CREATE TRIGGER trig_upd_salary
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN 
		SET NEW.salary = OLD.salary; 
END IF;
END $$
DELIMITER;

# UPDATE the value in the salaries table

UPDATE salaries 
SET 
    salary = 98765
WHERE
    emp_no = 10001
        AND from_date = '2010-06-22';
        
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 10001
        AND from_date = '2010-06-22';

# the salary will not change, it can know only the salary is higher than 0, then the value will be update
        
UPDATE salaries 
SET 
    salary = -50000
WHERE
    emp_no = 10001
        AND from_date = '2010-06-22';
        
# this is system function, and it also called built-in functios
# this function means it will delivers the date and time of the moment at which you have invoked this function

SELECT SYSDATE();

# change the date format

SELECT DATE_FORMAT(SYSDATE(), '%y-%m-%d') as today;

DELIMITER $$

CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary int;
    
    SELECT 
		MAX(salary)
	INTO v_curr_salary FROM
		salaries
	WHERE
		emp_no = NEW.emp_no;

	IF v_curr_salary IS NOT NULL THEN
		UPDATE salaries 
		SET 
			to_date = SYSDATE()
		WHERE
			emp_no = NEW.emp_no AND to_date = NEW.to_date;

		INSERT INTO salaries 
			VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
    END IF;
END $$
DELIMITER ;

INSERT INTO dept_manager VALUES ('111534', 'd009', date_format(sysdate(), '%y-%m-%d'), '9999-01-01');

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no = 111534;
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no = 111534;

ROLLBACK;

COMMIT;

DELIMITER $$
CREATE TRIGGER trig_hire_date  
BEFORE INSERT ON employees
FOR EACH ROW  
BEGIN  
	IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN
		SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');     
END IF;  
END $$  
DELIMITER ;

INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

ROLLBACK;
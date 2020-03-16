CREATE TABLE customers
(
	customer_id VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY(customer_id),
    UNIQUE KEY(email_address)
);

DROP TABLE customers;

CREATE TABLE customers
(
	customer_id VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY(customer_id)
);

ALTER TABLE customers
ADD UNIQUE KEY(email_address);

ALTER TABLE customers
DROP INDEX email_address;
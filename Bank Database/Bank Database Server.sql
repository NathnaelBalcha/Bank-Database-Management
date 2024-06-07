CREATE DATABASE Group_Assignment;
USE Group_Assignment;

CREATE TABLE account (
  account_number int(6) NOT NULL,
  customer_id int(5) NOT NULL,
  account_type varchar(20) NOT NULL,
  balance int(10) NOT NULL DEFAULT 20
);

INSERT INTO account (account_number, customer_id, account_type, balance) VALUES
(1983611, 168, 'Saving', 800),
(1983613, 681, 'Saving', 2050),
(1983614, 682, 'Current', 20000),
(1983615, 683, 'Current', 400),
(1983616, 684, 'Saving', 80150),
(1983619, 685, 'Current', 46800),
(1983642, 686, 'Saving', 2130),
(1983643, 168, 'Current', 2020),
(1983645, 687, 'Saving', 900),
(1983646, 685, 'Saving', 20),
(1983647, 688, 'Saving', 100000);

SELECT *FROM account;

CREATE TABLE branch (
  branch_code int(5) NOT NULL,
  branch_name varchar(25) NOT NULL,
  branch_manager int(5) NOT NULL,
  branch_address varchar(50) NOT NULL
);

INSERT INTO branch (branch_code, branch_name, branch_manager, branch_address) VALUES
(1, 'Gofa Sefer', 3, 'Ethiopia, Addis Ababa'),
(2, 'Bunna Board', 6, 'Ethiopia, Addis Ababa'),
(3, 'Castle', 7, 'Ethiopia, Mekelle'),
(4, 'Axum 32', 14, 'Ethiopia, Axum'),
(5, 'Mekelle 16', 9, 'Ethiopia, Mekelle');

SELECT *FROM branch;

CREATE TABLE customer (
  customer_id int(4) NOT NULL,
  opened_branch int(10) NOT NULL,
  first_name varchar(20) NOT NULL,
  middle_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  address varchar(20) NOT NULL,
  mobile_number varchar(13) NOT NULL
);

INSERT INTO customer (customer_id, opened_branch, first_name, middle_name, last_name, address, mobile_number) VALUES
(168, 1, 'Nathnael', 'Balcha', 'Edaie', 'Ethiopia, Addis Abab', '+25193786922'),
(681, 2, 'Nathnael', 'Demelash', 'Gemechu', 'Ethiopia, Addis Abeb', '+251977258200'),
(682, 3, 'Abel', 'Balcha', 'Gedu', 'Ethiopia, Mekelle', '+251919473950'),
(683, 5, 'Bertemios', 'Kumel', 'Edaie', 'Ethiopia, Adigrat', '+251999274826'),
(684, 1, 'Kidus', 'Abichu', 'Kumel', 'Ethiopia, Awasa', '+251947135937'),
(685, 2, 'Gebremedhn', 'Abadi', 'Agenehu', 'Ethiopia, Adama', '+251977263544'),
(686, 3, 'Abraham', 'Yisak', 'Noh', 'Ethiopia, Wukro', '+251946555723'),
(687, 4, 'Siem', 'Abay', 'Weldu', 'Ethiopia, Shire', '+251913245332'),
(688, 5, 'Tekle', 'Haile', 'Gebre', 'Ethiopia, Mekelle', '+251926972238');

SELECT *FROM customer;

CREATE TRIGGER Account_ADD AFTER INSERT ON customer FOR EACH ROW INSERT INTO account VALUES 
(NULL,NEW.customer_id , 'SV', '20');

CREATE TABLE employee (
  employee_id int(5) NOT NULL,
  first_name varchar(20) NOT NULL,
  middle_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  phone_number varchar(13) NOT NULL,
  position varchar(20) NOT NULL,
  address varchar(40) NOT NULL
);

INSERT INTO employee (employee_id, first_name, middle_name, last_name, phone_number, position, address) VALUES
(3, 'Nathnael', 'Balcha', 'Edaie', '+251937886922', 'Emp 001', 'Ethiopia, Addis Ababa'),
(4, 'Lara', 'Ross', 'Mills', '+251975643792', 'Emp 002', 'Ethiopia, Addis Ababa'),
(5, 'Balcha', 'Edaie', 'Mako', '+251937886673', 'Emp 002', 'Ethiopia, Addis Ababa'),
(6, 'Lara', 'Ross', 'Mills', '+251975643792', 'Emp 001', 'Ethiopia, Addis Ababa'),
(7, 'Rylan', 'Fiedman', 'Taylor', '+251923476843', 'Emp 001', 'Ethiopia, Mekelle'),
(8, 'June', 'Cross', 'Wang', '+251666437925', 'Emp 002', 'Ethiopia, Addis Ababa'),
(9, 'Siena', 'Brandt', 'Campos', '+251937845567', 'Emp 001', 'Ethiopia, Mekelle'),
(10, 'Wesley', 'Houston', 'Acosta', '+251975854492', 'Emp 002', 'Ethiopia, Addis Ababa'),
(11, 'Avi', 'Barry', 'Hull', '+251937822345', 'Emp 002', 'Ethiopia, Mekelle'),
(12, 'Oscar', 'Ross', 'Hines', '+251973445621', 'Emp 002', 'Ethiopia, Mekelle'),
(13, 'Theo', 'Cameron', 'Palmer', '+251933356678', 'Emp 002', 'Ethiopia, Mekelle'),
(14, 'Selem', 'Rosas', 'Chavez', '+251975334592', 'Emp 001', 'Ethiopia, Axum'),
(15, 'John', 'Garza', 'Walter', '+251937833442', 'Emp 002', 'Ethiopia, Axum'),
(16, 'Edison', 'Villa', 'Lugo', '+251975623343', 'Emp 002', 'Ethiopia, Axum');

SELECT *FROM customer;

CREATE TABLE transaction (
  transaction_number int(5) NOT NULL,
  account_number int(6) NOT NULL,
  transaction_date date DEFAULT current_timestamp(),
  transaction_branch int(5) DEFAULT NULL,
  transaction_type varchar(20) NOT NULL,
  transaction_amount int(68) NOT NULL DEFAULT 0
);

INSERT INTO transaction (transaction_number, account_number, transaction_date, transaction_branch, transaction_type, transaction_amount) VALUES
(1983657, 1983643, '2024-01-14', 1, 'Credited', 2000),
(1983658, 1983613, '2024-01-14', 1, 'Credited', 2000),
(1983659, 1983642, '2024-01-12', 2, 'Credited', 2000),
(1983660, 1983616, '2024-01-01', 3, 'Credited', 80000),
(1983661, 1983647, '2024-01-16', 5, 'Credited', 100000),
(1983662, 1983647, '2024-01-16', 4, 'Debited', 20);

SELECT *FROM transaction;

CREATE TRIGGER After_Transction_Credited AFTER INSERT ON transaction FOR EACH ROW UPDATE  account SET
balance = balance + NEW.transaction_amount
WHERE 
account_number = NEW.account_number && NEW.transaction_type = "Credited";

CREATE TRIGGER After_Transction_Debited AFTER INSERT ON transaction FOR EACH ROW UPDATE  account SET
balance = balance - NEW.transaction_amount
WHERE 
   account_number = NEW.account_number
&& NEW.transaction_type = "Debited"
&& balance - NEW.transaction_amount >20;

ALTER TABLE account
ADD PRIMARY KEY (account_number),
ADD KEY Customer_info (customer_id) USING BTREE;

ALTER TABLE branch
ADD PRIMARY KEY (branch_code),
ADD KEY branch_manager_id (branch_manager);  
  
ALTER TABLE customer
ADD PRIMARY KEY (customer_id),
ADD KEY branch_code_id (opened_branch);
  
ALTER TABLE employee
ADD PRIMARY KEY (employee_id);
  
ALTER TABLE transaction
ADD PRIMARY KEY (transaction_number),
ADD KEY transaction (transaction_branch);
  
ALTER TABLE account
MODIFY account_number int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1983648;
  
ALTER TABLE branch
MODIFY branch_code int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
  
ALTER TABLE customer
MODIFY customer_id int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1342689;
  
ALTER TABLE employee
MODIFY employee_id int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
  
ALTER TABLE transaction
MODIFY transaction_number int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1983663;
  
ALTER TABLE account
ADD CONSTRAINT Customer_Account FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE branch
ADD CONSTRAINT branch_manager_id FOREIGN KEY (branch_manager) REFERENCES employee (employee_id) ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE customer
ADD CONSTRAINT branch_code_id FOREIGN KEY (opened_branch) REFERENCES branch (branch_code) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE transaction
ADD CONSTRAINT transaction FOREIGN KEY (transaction_branch) REFERENCES branch (branch_code) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE VIEW Display_Bankinfo AS
SELECT
b.branch_code,
b.branch_name,
b.branch_address,
e.employee_id,
e.first_name,
e.middle_name,
e.last_name,
e.phone_number
FROM branch b
JOIN employee e 
on b.branch_manager = e.employee_id;

CREATE VIEW Display_CustomerAccount AS
SELECT
c.customer_id,
c.first_name,
c.middle_name,
c.last_name,
a.account_number,
a.account_type,
a.balance
FROM customer c
JOIN account a 
on c.customer_id = a.customer_id;

CREATE PROCEDURE Display_Account() NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER 
SELECT * FROM account;

CREATE PROCEDURE Display_Branch() NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER 
SELECT * FROM branch;

CREATE PROCEDURE Display_Customer() NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER 
SELECT * FROM customer;

CREATE PROCEDURE Display_Employee() NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER 
SELECT * FROM employee;

CREATE PROCEDURE Display_Transaction() NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER 
SELECT * FROM transaction;

-- Database Code End --

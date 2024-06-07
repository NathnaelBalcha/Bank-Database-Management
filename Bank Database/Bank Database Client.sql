CALL Display_Account();

CALL Display_Branch();

CALL Display_Customer();

CALL Display_Employee();

CALL Display_Transaction();

CALL Display_Bank_info;

CALL Display_Customer_Account;

 
 INSERT INTO branch (branch_code, branch_name, branch_manager, branch_address) VALUES 
 (NULL, 'Mit', '15', 'Ethiopia, Addis Ababa');
 
 INSERT INTO employee (employee_id, first_name, middle_name, last_name, phone_number, position, address) VALUES 
 (NULL, 'Nathnael', 'Haile', 'Gebre', '+251937886922', 'Emp 001', 'Ethiopia, Addis Ababa');

 INSERT INTO customer (customer_id, opened_branch, first_name, middle_name, last_name, address, mobile_number) VALUES 
 (NULL, '2', 'Abel', 'Mako', 'A', 'Ethiopia, Mekelle', '+251342515767');
 
 INSERT INTO account (account_number, customer_id, account_type, balance) VALUES 
 (NULL, '681', 'Current', '20');
 -- account_type = Current or Saving
 
 INSERT INTO transaction (transaction_number, account_number, transaction_date, transaction_branch, transaction_type, transaction_amount) VALUES 
 (NULL, '1983647', '2024-01-25', '5', 'Debited', '99000');
-- transaction_type = Debited or Credited
 
 COMMIT;
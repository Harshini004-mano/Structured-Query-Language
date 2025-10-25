use bank_db;

CREATE TABLE bank_accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    holder_name VARCHAR(100) NOT NULL,
    account_type VARCHAR(50),
    balance DECIMAL(12,2) DEFAULT 0
);
select * from bank_accounts;






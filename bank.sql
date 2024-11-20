DROP database newdatabase;
create database newdatabase;
use newdatabase;
CREATE TABLE branch (
    Branch_name VARCHAR(30) PRIMARY KEY,
    Branch_city VARCHAR(25),
    assets INT
);
CREATE TABLE BankAccount (
    Accno INT PRIMARY KEY,
    Branch_name VARCHAR(30),
    Balance INT,
    FOREIGN KEY (Branch_name) REFERENCES branch(Branch_name)
);
CREATE TABLE BankCustomer (
    Customername VARCHAR(20) PRIMARY KEY,
    Customer_street VARCHAR(30),
    CustomerCity VARCHAR(35)
);
CREATE TABLE Depositor (
    Customername VARCHAR(20),
    Accno INT,
    PRIMARY KEY(Customername, Accno),
    FOREIGN KEY (Accno) REFERENCES BankAccount(Accno),
    FOREIGN KEY (Customername) REFERENCES BankCustomer(Customername)
);
CREATE TABLE Loan (
    Loan_number INT PRIMARY KEY,
    Branch_name VARCHAR(30),
    Amount INT,
    FOREIGN KEY (Branch_name) REFERENCES branch(Branch_name)
);
INSERT INTO branch (Branch_name, Branch_city, assets) VALUES ('SBI_Chamrajpet', 'Bangalore', 50000);
INSERT INTO branch (Branch_name, Branch_city, assets) VALUES ('SBI_ResidencyRoad', 'Bangalore', 10000);
INSERT INTO branch (Branch_name, Branch_city, assets) VALUES ('SBI_Shivajiroad', 'Bombay', 20000);
INSERT INTO branch (Branch_name, Branch_city, assets) VALUES ('SBI_Parlimentroad', 'Delhi', 10000);
INSERT INTO branch (Branch_name, Branch_city, assets) VALUES ('SBI_Jantarmantar', 'Delhi', 20000);
SELECT * FROM branch;
INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES (1, 'SBI_Chamrajpet', 2000);
INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES (2, 'SBI_ResidencyRoad', 5000);
INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES (3, 'SBI_ShivajiRoad', 6000);
INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES (4, 'SBI_ParlimentRoad', 9000);
INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES (5, 'SBI_Jantarmantar', 8000);
INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES (6, 'SBI_ShivajiRoad', 4000);
INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES (8, 'SBI_ResidencyRoad', 4000);
INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES (9, 'SBI_ParlimentRoad', 3000);
INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES (10, 'SBI_ResidencyRoad', 5000);
INSERT INTO BankAccount (Accno, Branch_name, Balance) VALUES (11, 'SBI_Jantarmantar', 2000);
SELECT * FROM BankAccount;
INSERT INTO BankCustomer (Customername, Customer_street, CustomerCity) VALUES ('Avinash', 'Bull_Temple_Road', 'Bangalore');
INSERT INTO BankCustomer (Customername, Customer_street, CustomerCity) VALUES ('Dinesh', 'Banerghatta_Road', 'Bangalore');
INSERT INTO BankCustomer (Customername, Customer_street, CustomerCity) VALUES ('Mohan', 'NationalCollege_Road', 'Bangalore');
INSERT INTO BankCustomer (Customername, Customer_street, CustomerCity) VALUES ('Nikil', 'Akbar_Road', 'Delhi');
INSERT INTO BankCustomer (Customername, Customer_street, CustomerCity) VALUES ('Ravi', 'Prithviraj_Road', 'Delhi');
SELECT * FROM BankCustomer;
INSERT INTO Depositor (Customername, Accno) VALUES ('Avinash', 1);
INSERT INTO Depositor (Customername, Accno) VALUES ('Dinesh', 2);
INSERT INTO Depositor (Customername, Accno) VALUES ('Nikil', 3);
INSERT INTO Depositor (Customername, Accno) VALUES ('Ravi', 4);
INSERT INTO Depositor (Customername, Accno) VALUES ('Avinash', 8);
INSERT INTO Depositor (Customername, Accno) VALUES ('Nikil', 9);
INSERT INTO Depositor (Customername, Accno) VALUES ('Dinesh', 10);
INSERT INTO Depositor (Customername, Accno) VALUES ('Nikil', 10);
SELECT * FROM Depositor;
INSERT INTO Loan (Loan_number, Branch_name, Amount) VALUES (1, 'SBI_Chamrajpet', 1000);
INSERT INTO Loan (Loan_number, Branch_name, Amount) VALUES (2, 'SBI_ResidencyRoad', 2000);
INSERT INTO Loan (Loan_number, Branch_name, Amount) VALUES (3, 'SBI_ShivajiRoad', 3000);
INSERT INTO Loan (Loan_number, Branch_name, Amount) VALUES (4, 'SBI_ParlimentRoad', 4000);
INSERT INTO Loan (Loan_number, Branch_name, Amount) VALUES (5, 'SBI_Jantarmantar', 5000);
SELECT * FROM Loan;

SELECT d.customername, ba.Accno, b.Branch_name, b.Branch_city
FROM depositor AS d
JOIN BankAccount AS ba ON d.Accno = ba.Accno
JOIN branch AS b ON ba.Branch_name = b.Branch_name
WHERE b.Branch_city = 'Delhi'
GROUP BY d.customername, ba.Accno, b.Branch_name, b.Branch_city
HAVING COUNT(DISTINCT b.Branch_name) = (
    SELECT COUNT(DISTINCT Branch_name)
    FROM branch
    WHERE Branch_city = 'Delhi'
);
SELECT DISTINCT bc.Customername
FROM BankCustomer AS bc
JOIN Loan AS l ON bc.Customername = l.Branch_name
WHERE bc.Customername NOT IN (
    SELECT d.Customername
    FROM Depositor AS d
);
SELECT DISTINCT bc.Customername
FROM BankCustomer AS bc
JOIN Depositor AS d ON bc.Customername = d.Customername
JOIN BankAccount AS ba ON d.Accno = ba.Accno
JOIN Loan AS l ON ba.Branch_name = l.Branch_name
WHERE ba.Branch_name IN (
    SELECT Branch_name
    FROM branch
    WHERE Branch_city = 'Bangalore'
);
SELECT Branch_name
FROM branch
WHERE assets > ALL (
    SELECT assets
    FROM branch
    WHERE Branch_city = 'Bangalore'
);
SELECT * FROM BankAccount;
UPDATE BankAccount SET
Balance = Balance + Balance * 0.05;
SELECT * FROM  BankAccount;
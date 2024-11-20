CREATE DATABASE SuppliersPartsCatalog;
USE SuppliersPartsCatalog;

CREATE TABLE SUPPLIERS (
    SID INT PRIMARY KEY,
    SNAME VARCHAR(50),
    CITY VARCHAR(50)
);


CREATE TABLE PARTS (
    PID INT PRIMARY KEY,
    PNAME VARCHAR(50),
    COLOR VARCHAR(20)
);

CREATE TABLE CATALOG (
    SID INT,
    PID INT,
    COST DECIMAL(10, 2),
    PRIMARY KEY (SID, PID),
    FOREIGN KEY (SID) REFERENCES SUPPLIERS(SID),
    FOREIGN KEY (PID) REFERENCES PARTS(PID)
);

INSERT INTO SUPPLIERS (SID, SNAME, CITY) VALUES
(10001, 'Acme Widget', 'Bangalore'),
(10002, 'Johns', 'Kolkata'),
(10003, 'Vimal', 'Mumbai'),
(10004, 'Reliance', 'Delhi');

INSERT INTO PARTS (PID, PNAME, COLOR) VALUES
(20001, 'Book', 'Red'),
(20002, 'Pen', 'Red'),
(20003, 'Pencil', 'Green'),
(20004, 'Mobile', 'Green'),
(20005, 'Charger', 'Black');

INSERT INTO CATALOG (SID, PID, COST) VALUES
(10001, 20001, 10),
(10001, 20002, 10),
(10001, 20003, 10),
(10002, 20001, 20),
(10002, 20003, 20),
(10003, 20004, 10),
(10003, 20005, 10),
(10004, 20003, 30),
(10004, 20004, 30),
(10004, 20005, 40);

SELECT * FROM SUPPLIERS;
SELECT * FROM PARTS;
SELECT * FROM CATALOG;
-- 1. Find the `pnames` of parts for which there is some supplier
SELECT DISTINCT pname
FROM Parts
WHERE pid IN (SELECT pid FROM Catalog);
-- 2. Find the `snames` of suppliers who supply every part
SELECT sname
FROM Suppliers
WHERE sid IN (
    SELECT sid
    FROM Catalog
    GROUP BY sid
    HAVING COUNT(pid) = (SELECT COUNT(pid) FROM Parts)
);
-- 3. Find the `snames` of suppliers who supply every red part
SELECT sname
FROM Suppliers
WHERE sid IN (
    SELECT DISTINCT sid
    FROM Catalog
    WHERE pid IN (SELECT pid FROM Parts WHERE color = 'red')
);
-- 4. Find the `pnames` of parts supplied by "acme widget" and by no one else
SELECT pname
FROM Parts AS p
WHERE pid IN (
    SELECT pid
    FROM Catalog AS c
    JOIN Suppliers AS s ON c.sid = s.sid
    WHERE s.sname = 'acme widget'
    GROUP BY c.pid
    HAVING COUNT(c.sid) = 1
);
-- 5. Find the `sids` of suppliers who charge more for some part than the average cost of that part
SELECT DISTINCT c.sid
FROM Catalog AS c
WHERE c.cost > (
    SELECT AVG(c2.cost)
    FROM Catalog AS c2
    WHERE c2.pid = c.pid
);
-- 6. For each part, find the `sname` of the supplier who charges the most for that part

SELECT p.pname, s.sname
FROM Parts AS p
JOIN Catalog AS c ON p.pid = c.pid
JOIN Suppliers AS s ON s.sid = c.sid
WHERE c.cost = (
    SELECT MAX(cost)
    FROM Catalog
    WHERE pid = p.pid
);



DROP database newdatabase;
create database newdatabase;
use newdatabase;
CREATE TABLE person(
    driver_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(20),
    address VARCHAR(30)
);

CREATE TABLE car (
    reg_num VARCHAR(10) PRIMARY KEY,
    model VARCHAR(10),
    year INT
);

CREATE TABLE accident (
    report_num INT PRIMARY KEY,
    accident_date DATE,
    location VARCHAR(20)
);

CREATE TABLE owns (
    driver_id VARCHAR(10),
    reg_num VARCHAR(10),
    PRIMARY KEY(driver_id, reg_num),
    FOREIGN KEY(driver_id) REFERENCES person(driver_id),
    FOREIGN KEY(reg_num) REFERENCES car(reg_num)
);

CREATE TABLE participated (
    driver_id VARCHAR(10),
    reg_num VARCHAR(10),
    report_num INT,
    damage_amount varchar(100),
    PRIMARY KEY(driver_id, reg_num, report_num),
    FOREIGN KEY(driver_id) REFERENCES person(driver_id),
    FOREIGN KEY(reg_num) REFERENCES car(reg_num),
    FOREIGN KEY(report_num) REFERENCES accident(report_num)
);
-- Insert into person
desc person;
INSERT INTO person (driver_id, name, address) VALUES ('D001', 'Piyush', 'Shantinagar');
INSERT INTO person (driver_id, name, address) VALUES ('D002', 'Jai', 'Frazer Town');
INSERT INTO person (driver_id, name, address) VALUES ('D003', 'Nandan', 'Baswangudi');
INSERT INTO person (driver_id, name, address) VALUES ('D004', 'Aditya', 'Hosur Road');
INSERT INTO person (driver_id, name, address) VALUES ('D005', 'Vaibhav', 'Benson Town');
select * from person;
-- Insert into CAR
desc car;
INSERT INTO car (reg_num, model, year) VALUES ('KA03KP9054', 'Porsche', 2015);
INSERT INTO car (reg_num, model, year) VALUES ('KA03MK9054', 'Ferrari', 2020);
INSERT INTO car (reg_num, model, year) VALUES ('KA03MZ9054', 'Buggati', 2021);
INSERT INTO car (reg_num, model, year) VALUES ('KA03KP9504', 'Toyota', 2018);
INSERT INTO car (reg_num, model, year) VALUES ('KA03MG7181', 'BMW', 2022);
desc car;
select * from car;

-- Insert into ACCIDENT
desc accident;
INSERT INTO accident (report_num, accident_date, location) VALUES (11, '2016-01-01', 'Mysore Road');
INSERT INTO accident (report_num, accident_date, location) VALUES (12, '2022-02-02', 'South End Circle');
INSERT INTO accident (report_num, accident_date, location) VALUES (13, '2021-01-21', 'Bull Temple Road');
INSERT INTO accident (report_num, accident_date, location) VALUES (14, '2019-02-17', 'Mysore Road');
INSERT INTO accident (report_num, accident_date, location) VALUES (15, '2023-03-05', 'Kanakpura Road');
select * from accident;
-- Insert into OWNS
desc owns;
INSERT INTO owns (driver_id, reg_num) VALUES ('D001', 'KA03KP9054');
INSERT INTO owns (driver_id, reg_num) VALUES ('D002', 'KA03MK9054');
INSERT INTO owns (driver_id, reg_num) VALUES ('D003', 'KA03MZ9054');
INSERT INTO owns (driver_id, reg_num) VALUES ('D004', 'KA03KP9504');
INSERT INTO owns (driver_id, reg_num) VALUES ('D005', 'KA03MG7181');
select * from owns;
-- Insert into PARTICIPATED
desc participated;
INSERT INTO participated (driver_id, reg_num, report_num, damage_amount) VALUES ('D001', 'KA03KP9054', 12, '20000');
INSERT INTO participated (driver_id, reg_num, report_num, damage_amount) VALUES ('D002', 'KA03MK9054', 11, '30000');
INSERT INTO participated (driver_id, reg_num, report_num, damage_amount) VALUES ('D003', 'KA03MZ9054', 13, '15000');
INSERT INTO participated (driver_id, reg_num, report_num, damage_amount) VALUES ('D004', 'KA03KP9504', 14, '25000');
INSERT INTO participated (driver_id, reg_num, report_num, damage_amount) VALUES ('D005', 'KA03MG7181', 15, '40000');
select * from participated; 
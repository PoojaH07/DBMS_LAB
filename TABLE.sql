show databases;
create database IF NOT exists newdatabase;
show databases;
use newdatabase;
create table poojah
(
name varchar(20)
);
select * from poojah;
CREATE TABLE STUDENT (
stdid INT(5), stdname varchar(20), dob date, fee INT(5), gender char );
DESC STUDENT;
INSERT INTO STUDENT ( stdid, stdname, dob, fee, gender)
VALUES (00001, 'HARRY', '2005-12-05', 60000, 'M');
INSERT INTO STUDENT ( stdid, stdname, dob, fee, gender)
VALUES (00002, 'CHARLIE', '2008-08-20', 60000, 'M');
INSERT INTO STUDENT ( stdid, stdname, dob, fee, gender)
VALUES (00003, 'NAILL', '2006-07-05', 60000, 'M');
INSERT INTO STUDENT ( stdid, stdname, dob, fee, gender)
VALUES (00004, 'HAILEY', '2006-07-05', 60000, 'F');
INSERT INTO STUDENT ( stdid, stdname, dob, fee, gender)
VALUES (00005, 'JOHN', '2012-09-15', 60000, 'M');
SELECT * FROM STUDENT;
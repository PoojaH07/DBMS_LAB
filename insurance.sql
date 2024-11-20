show databases;
create database IF NOT exists newdatabase;
show databases;
use newdatabase;
create table insurance
(
name varchar(20)
);
select * from insurance;
create table car(reg_num varchar(10),model varchar(10),year int, primary key(reg_num));
DESC CAR;
INSERT INTO car VALUE( 'KA052250','Indica',1990 );
INSERT INTO car VALUE( 'KA031181','Lancer',1957 );
INSERT INTO car VALUE( 'KA095477','Toyota',1998 );
INSERT INTO car VALUE( 'KA053408','Honda',2008 );
INSERT INTO car VALUE( 'KA041702','Audi',2005 );
SELECT * FROM CAR;

create table accident(report_num int, accident_date date, location varchar(100),primary key(report_num));
DESC ACCIDENT;
INSERT INTO ACCIDENT VALUES (11, '01-01-03', 'Mysore Road');
INSERT INTO ACCIDENT VALUES (14, '17-02-08', 'Mysore Road');
SELECT * FROM accident;

create table owns(driver_id varchar(10),reg_num varchar(10),primary key(driver_id, reg_num),foreign key(driver_id) references person(driver_id),foreign key(reg_num) references car(reg_num));
DESC owns;
INSERT INTO owns VALUE( 'A01', 'KA052250');
INSERT INTO owns VALUE( 'A02', ' KA053408'  );
INSERT INTO owns VALUE( 'A03', 'KA031181' );
INSERT INTO owns VALUE( 'A04' , 'KA095477' );
INSERT INTO owns VALUE( 'A05' , 'KA041702' );
SELECT * FROM OWNS;







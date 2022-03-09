CREATE DATABASE BUS_TICKET ;
USE BUS_TICKET ;

DROP TABLE IF EXISTS Ticket_info;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Fares;
DROP TABLE IF EXISTS Driver;

CREATE TABLE Ticket_info(
ticket_id VARCHAR(10) PRIMARY KEY, bus_no VARCHAR(5) NOT NULL, Start_City VARCHAR(30), End_City VARCHAR(30), Total_Fare DECIMAL NOT NULL,Seats tinyint, Vehicle_Make ENUM('Volvo', 'TATA', 'Mercedes'), Date_of_travel DATE NOT NULL,Distance DECIMAL NOT NULL);

CREATE TABLE Customer(
customer_id VARCHAR(10) PRIMARY KEY, customer_name VARCHAR(50), customer_idproof VARCHAR(40), customer_phone INT NOT NULL,ticket_id VARCHAR(10), Date_of_travel DATE NOT NULL, FOREIGN KEY (ticket_id) REFERENCES Ticket_info(ticket_id), CONSTRAINT Tic_id_Customer_integrity UNIQUE(ticket_id)); 


CREATE TABLE Fares(
Vehicle_Make ENUM('Volvo', 'TATA', 'Mercedes'), FARE_Perkm INT NOT NULL, Distance DECIMAL NOT NULL, Total_Fare DECIMAL NOT NULL,ticket_id VARCHAR(10) UNIQUE PRIMARY KEY, Date_of_travel DATE NOT NULL,FOREIGN KEY (ticket_id) REFERENCES Ticket_info (ticket_id), CONSTRAINT Tic_Customer_integrity UNIQUE(ticket_id)); 


CREATE TABLE Driver(
ticket_id VARCHAR(10), d_name VARCHAR(50), d_id VARCHAR(10),bus_no VARCHAR(5) NOT NULL,Start_City VARCHAR(30), End_City VARCHAR(30), FOREIGN KEY (ticket_id) REFERENCES Ticket_info(ticket_id), CONSTRAINT Tic_id_Customer_integrity UNIQUE(ticket_id));

INSERT INTO Ticket_info VALUES('101','721','Delhi','Jaipur',3016.00,36,'Mercedes', '2022-01-30',232.00);
INSERT INTO Ticket_info VALUES('102','771','Amritsar','Haryana',2814.00,40,'Volvo','2022-01-30',232.00);
INSERT INTO Ticket_info VALUES('103','321','Agra','Delhi',2090.00,44,'TATA','2022-01-31',232.00);
INSERT INTO Ticket_info VALUES('104','112','Jaipur','Moga',3430.00,40,'Volvo','2022-02-01',232.00);
INSERT INTO Ticket_info VALUES('105','543','Chandigarh','Delhi',4004.00,40,'Volvo','2022-02-02',232.00);


INSERT INTO Customer VALUES('AA100','Harish Kumar','4532',999932123,'101','2022-01-30');
INSERT INTO Customer VALUES('AA102','Kush Mehra','3265',999932997,'103','2022-01-31');
INSERT INTO Customer VALUES('AA103','Akhilesh Pal','4534',999932124,'104','2022-02-01');
INSERT INTO Customer VALUES('AA104','Babjeet Singh','6969',999932120,'105','2022-02-02');

INSERT INTO Fares VALUES('Mercedes', 13, 232.00, 3016.00, '101', '2022-01-30'); 
INSERT INTO Fares VALUES('TATA', 13, 290.00, 2090.00, '103','2022-01-31' ); 
INSERT INTO Fares VALUES('Volvo', 14, 245.00, 3430.00, '104','2022-02-01'); 
INSERT INTO Fares VALUES('Volvo', 14, 286.00, 4004.00, '105','2022-02-02'); 

INSERT INTO Driver VALUES('101', 'Brijesh Singh', 'Z334', '721', 'Delhi','Jaipur');
INSERT INTO Driver VALUES('103', 'Kushwant Singh', 'Z336', '321','Agra','Delhi');
INSERT INTO Driver VALUES('104', 'Manohar Dubey', 'Z337', '112','Jaipur','Moga');
INSERT INTO Driver VALUES('105', 'Rampal', 'Z301', '543','Chandigarh','Delhi');

Select * from Ticket_info;
Select * from Customer;
Select * from Fares;
Select * from Driver;

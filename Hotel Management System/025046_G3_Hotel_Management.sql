DROP TABLE IF EXISTS BookingRecord;
DROP TABLE IF EXISTS DiscountRate;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS RoomType;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS Hotel_Owner;
DROP TABLE IF EXISTS HotelManagers;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS User;

create table User (
id VARCHAR(10) PRIMARY KEY,name VARCHAR(40),address VARCHAR(100),phone_num INT NOT NULL,email VARCHAR(100) NOT NULL);

create table Hotel_Owner (
id VARCHAR(10) PRIMARY KEY, userName VARCHAR(50) NOT NULL, password VARCHAR(100) NOT NULL, FOREIGN KEY(id) REFERENCES User(id), CONSTRAINT userNameOwner_integrity UNIQUE(userName));

create table HotelManagers (
id VARCHAR(10) PRIMARY KEY, userName VARCHAR(50) NOT NULL, password VARCHAR(100) NOT NULL, FOREIGN KEY (id) REFERENCES User(id) , CONSTRAINT userNameManager_integrity UNIQUE(userName));

create table Customer (
id VARCHAR(10), PRIMARY KEY (id), FOREIGN KEY (id) REFERENCES User(id));

DROP TABLE IF EXISTS Hotel;

create table Hotel (
id VARCHAR(10), name text NOT NULL, managerID Varchar(10) NOT NULL UNIQUE, ownerID VARCHAR(10) NOT NULL, address text, phone INTEGER, PRIMARY KEY (id), FOREIGN KEY (managerID) REFERENCES HotelManagers(id), FOREIGN KEY (ownerID) REFERENCES Hotel_Owner(id));
DROP TABLE IF EXISTS HotelUnavailability ;

create table HotelUnavailability (
id VARCHAR(10), HotelID VARCHAR(10) NOT NULL, status text NOT NULL, start DATE NOT NULL, end DATE NOT NULL, PRIMARY KEY (id), FOREIGN KEY (HotelID) REFERENCES Hotel(id));

create table RoomType (
id VARCHAR(10), numPeople INTEGER NOT NULL, extraBed BOOLEAN NOT NULL, priceRate decimal NOT NULL, PRIMARY KEY(id));

create table department (
d_id VARCHAR(10) PRIMARY KEY, id VARCHAR(10) NOT NULL, d_name ENUM('Reception', 'Room_Service', 'Dining', 'Travel_Forex', 'Maintenance', 'Accounts', 'Administration', 'Security', 'Sales'),FOREIGN KEY (id) REFERENCES User(id)) ;

create table Staff (
id VARCHAR(10) NOT NULL,d_id VARCHAR(10) NOT NULL, ename VARCHAR(50), e_age tinyint, e_address VARCHAR(100), e_idproof VARCHAR(30), FOREIGN KEY (id) REFERENCES User(id));

create table HotelRoom (
id VARCHAR(10), HotelID VARCHAR(10), roomNum INTEGER, type VARCHAR(50) NOT NULL, status	text(20) NOT NULL, PRIMARY KEY(id), FOREIGN KEY (HotelID) REFERENCES Hotel(id), FOREIGN KEY (type) REFERENCES RoomType(id), UNIQUE (HotelID,roomNum));

create table DiscountRate (
id VARCHAR(10), HotelID VARCHAR(10) NOT NULL, roomType VARCHAR(10) NOT NULL, start DATE NOT NULL, end DATE NOT NULL, discRate decimal NOT NULL, PRIMARY KEY(id), FOREIGN KEY (HotelID) REFERENCES Hotel(id), FOREIGN KEY (roomType) REFERENCES RoomType(id));

create table Booking (
id VARCHAR(10), HotelID VARCHAR(10) NOT NULL, CustomerID VARCHAR(10) NOT NULL, start DATE NOT NULL, end DATE NOT NULL, PIN VARCHAR(10) NOT NULL, PRIMARY KEY (id), FOREIGN KEY(HotelID) REFERENCES Hotel(id), FOREIGN KEY (CustomerID) REFERENCES Customer(id));

create table BookingRecord (
id VARCHAR(10), bookingID VARCHAR(10) NOT NULL, HotelID VARCHAR(10) NOT NULL, roomType VARCHAR(10) NOT NULL, extraBed BOOLEAN, room VARCHAR(10) REFERENCES HotelRoom(id), roomNum VARCHAR(10) NOT NULL, start DATE NOT NULL, end DATE NOT NULL, price decimal NOT NULL, PRIMARY KEY (id), FOREIGN KEY (bookingID) REFERENCES Booking(id), FOREIGN KEY (RoomType) REFERENCES RoomType(id), FOREIGN KEY (HotelID) REFERENCES Hotel(id));

insert into User (id,name,address,phone_num,email) values ('AZX1','John','1 Anzac Pde., NSW 2035',040111111,'john@gmail.com');
insert into User (id,name,address,phone_num,email) values ('AZX2','Sameer Ghosh','287, Ghaziabad, UP',999933543,'rameshji@gmail.com');
insert into User (id,name,address,phone_num,email) values ('AZX3','Dhruv Jones','333, Kamlesh Nagar, Delhi',999987788,'khoses@gmail.com');
insert into User (id,name,address,phone_num,email) values ('AZX4','Ayushi','17, Kanpur, UP',9976764398,'ekkk1991@gmail.com');
insert into User (id,name,address,phone_num,email) values ('AZX5','Majnu Singh','555, Shakur Basti, Delhi',966122190,'shakurbastitheif@gmail.com');
insert into User (id,name,address,phone_num,email) values ('AZX6','Mary','2AnzacPde NSW2035',904444111,'mary@gmail.com');
insert into User (id,name,address,phone_num,email) values ('AZX7','Eric','3 Anzac Pde., NSW 2035',040111113,'eric@gmail.com');
insert into Hotel_Owner (id, userName, password) values ('OWN1','john','password');
insert into Hotel_Owner (id, userName, password) values ('OWN2','paul','pop1');
insert into Hotel_Owner (id, userName, password) values ('OWN3','dinesh','pop2');
insert into Hotel_Owner (id, userName, password) values ('OWN4','branson','pop21');
insert into Hotel_Owner (id, userName, password) values ('OWN5','jack','pop12');


insert into HotelManagers values ('MNG1','jacks','password111');
insert into HotelManagers values ('MNG2','Deep','password19');
insert into HotelManagers values ('MNG3','Punnesh','password101');
insert into HotelManagers values ('MNG4','rameshji','password909');
insert into HotelManagers values ('MNG5','donesh','password998');
insert into HotelManagers values ('MNG6','erica','passwordss8');

insert into Hotel (name,managerID,ownerID,address,phone) values ('Gurugram Branch','MNG2','OWN1','Sector 26',040111114);
insert into Hotel (name,managerID,ownerID,address,phone) values ('Noida Branch','MNG1','OWN1','101, Sector 18',040111115);

insert into RoomType values ('ABCX7',2,0,3500);
insert into RoomType values ('ABCX8',3,1,4500);
insert into RoomType values ('ABCX9',2,0,2599);
insert into RoomType values ('ABCX10',3,1,4700);
insert into RoomType values ('ABCX11',2,0,5000);

insert into HotelRoom (hotelID,roomNum,type,status) values ('AAA1',10,'Single Room (with 1 single bed)', 'Available');
insert into HotelRoom (hotelID,roomNum,"type",status) values ('AAA2',11,'Single Room (with 1 single bed)', 'Available');
insert into HotelRoom (hotelID,roomNum,"type",status) values ('AAA3',12,'Single Room (with 1 single bed)', 'Available');
insert into HotelRoom (hotelID,roomNum,"type",status) values ('AAA4',21,'Single Room (with 1 double bed)', 'Available');
insert into HotelRoom (hotelID,roomNum,"type",status) values ('AAA5',22,'Single Room (with 2 single beds)', 'Available');
insert into HotelRoom (hotelID,roomNum,"type",status) values ('AAA6',23,'Single Room (with 3 single beds)', 'Not-Available');
select * from User ; 
select * from RoomType ;

CREATE USER 'jack'@'localhost' IDENTIFIED BY 'jack';
GRANT ALL PRIVILEGES ON *.* TO 'jack'@'localhost';

CREATE USER 'john'@'localhost' IDENTIFIED BY 'john';
GRANT ALL PRIVILEGES ON *.* TO 'john'@'localhost';

CREATE USER 'branson'@'localhost' IDENTIFIED BY 'branson';
GRANT ALL PRIVILEGES ON *.* TO 'branson'@'localhost';

CREATE USER 'dinesh'@'localhost' IDENTIFIED BY 'dinesh';
GRANT ALL PRIVILEGES ON *.* TO 'dinesh'@'localhost';

CREATE USER 'paul'@'localhost' IDENTIFIED BY 'paul';
GRANT ALL PRIVILEGES ON *.* TO 'paul'@'localhost';

#Creating user id for managers
CREATE USER 'jacks'@'localhost' IDENTIFIED BY 'jacks';
GRANT ALL PRIVILEGES ON Customer, HotelRoom, Hotel, RoomType, DiscountRate, Booking, BookingRecord TO 'jacks'@'localhost'; 

CREATE USER 'deep'@'localhost' IDENTIFIED BY 'deep';
GRANT ALL PRIVILEGES ON Customer, HotelRoom, Hotel, RoomType, DiscountRate, Booking, BookingRecord TO 'deep'@'localhost' ; 

CREATE USER 'punnesh'@'localhost' IDENTIFIED BY 'punnesh';
GRANT ALL PRIVILEGES ON Customer, HotelRoom, Hotel, RoomType, DiscountRate, Booking, BookingRecord TO 'punnesh'@'localhost' ; 

CREATE USER 'rameshji'@'localhost' IDENTIFIED BY 'rameshji';
GRANT ALL PRIVILEGES ON Customer, HotelRoom, Hotel, RoomType, DiscountRate, Booking, BookingRecord TO 'rameshji'@'localhost' ; 

CREATE USER 'rameshji'@'localhost' IDENTIFIED BY 'rameshji';
GRANT ALL PRIVILEGES ON Customer, HotelRoom, Hotel, RoomType, DiscountRate, Booking, BookingRecord TO 'rameshji'@'localhost' ; 

CREATE USER 'donnesh'@'localhost' IDENTIFIED BY 'donnesh';
GRANT ALL PRIVILEGES ON Customer, HotelRoom, Hotel, RoomType, DiscountRate, Booking, BookingRecord TO 'donnesh'@'localhost' ; 

CREATE USER 'erica'@'localhost' IDENTIFIED BY 'erica';
GRANT ALL PRIVILEGES ON Customer, HotelRoom, Hotel, RoomType, DiscountRate, Booking, BookingRecord TO 'erica'@'localhost' ; 


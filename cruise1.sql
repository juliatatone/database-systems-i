Drop table Passenger;
Drop table RoomType;
Drop table Ship;
Drop table Cruise;
Drop table Booking;
Drop sequence shipID_seq;
Drop sequence passengerID_seq;
Drop sequence bookingID_seq;
Drop sequence cruiseID_seq;

Create table Passenger(
	passengerID number(4),
	firstName varchar2(15),
	lastName varchar2(25),
	address varchar2(25),
	city varchar2(15),
	state char(2),
	zipcode char(5),
	phone number(10),
	birthdate date,
	Constraint Passenger_PK Primary Key (passengerID),
	Constraint Passenger_UK Unique(firstName),
	Constraint Passenger_UQ Unique(lastName),
	Constraint birthdate_UK Unique(birthdate)
);
Create table RoomType(
	roomType varchar2(25),
	maxCapacity number(5) NOT NULL,
	Constraint RoomType_PK Primary Key (roomType)
);
Create table Ship(
	shipID number(3),
	shipName varchar2(25),
	yearBuilt number(4),
	yearRefurbished number(4),
	maxPassengers number(4),
	Constraint Ship_PK Primary Key (shipID)
);
Create table Cruise(
	cruiseID number(3),
	shipID number(3),
	startDate date,
	endDate date,
	cruiseLength number(3),
	Constraint Cruise_PK Primary Key (cruiseID)
);
Create table Booking(
	bookingID number(4),
	passengerID number(4),
	roomType varchar2(25),
	cruiseID number(4),
	cabin char(4),
	price decimal(10,2),
	Constraint Booking_PK Primary Key (bookingID)
);
Create sequence bookingID_seq start with 1 increment by 1;
insert into Booking values(bookingID_seq.nextval, 5, 'Balcony Suite', 8, 'A121', 550);
insert into Booking values(bookingID_seq.nextval, 8, 'Suite', 6, 'B230', 450);
insert into Booking values(bookingID_seq.nextval, 7, 'Spa Stateroom', 1, 'C410', 890);
insert into Booking values(bookingID_seq.nextval, 6, 'Balcony Suite', 3, 'D102', 1000);
insert into Booking values(bookingID_seq.nextval, 1, 'Oceanview', 5, 'C320', 560);
insert into Booking values(bookingID_seq.nextval, 3, 'Studio', 4, 'B120', 489);
insert into Booking values(bookingID_seq.nextval, 2, 'Oceanview', 7, 'C230', 780);
insert into Booking values(bookingID_seq.nextval, 12, 'Spa Stateroom', 8, 'B230', 950);
insert into Booking values(bookingID_seq.nextval, 10, 'Suite', 1, 'C120', 850);
insert into Booking values(bookingID_seq.nextval, 4, 'Balcony Suite', 4, 'D520', 798);
insert into Booking values(bookingID_seq.nextval, 9, 'Studio', 6, 'C321', 905);
insert into Booking values(bookingID_seq.nextval, 11, 'Suite', 2, 'A453', 894);
insert into Booking values(bookingID_seq.nextval, 1, 'Oceanview', 8, 'D420', 560);
insert into Booking values(bookingID_seq.nextval, 8, 'Studio', 5, 'C452', 450);
insert into Booking values(bookingID_seq.nextval, 6, 'Spa Stateroom', 2, 'B365', 650);
insert into Booking values(bookingID_seq.nextval, 12, 'Suite', 1, 'C258', 750);
select * from Booking;
Create sequence passengerID_seq start with 1 increment by 1;
insert into Passenger values(passengerID_seq.nextval, 'James', 'Smith', '124 Cambridge Ave.', 'Boston', 'MA', 12345, 5082328798, '15-Mar-74');
insert into Passenger values(passengerID_seq.nextval, 'John', 'Johnson', '12 Oak Street', 'New York', 'NY', 52564, 6174153059, '28-Feb-65');
insert into Passenger values(passengerID_seq.nextval, 'Robert', 'Williams', '126 Manhattan Ave.', 'San Francisco', 'CA', 85964, 2123043923, '3-Jun-85');
insert into Passenger values(passengerID_seq.nextval, 'Michael', 'Brown', '45 Massachusetts road', 'Austin', 'TX', 23145, 7818914567, '17-May-95');
insert into Passenger values(passengerID_seq.nextval, 'William', 'Jones', '25 Lincoln Ave.', 'Hartford', 'CT', 89745, 8915367188, '11-Apr-89');
insert into Passenger values(passengerID_seq.nextval, 'David', 'Garcia', '26 Washington street', 'Chicago', 'IL', 12457, 1233753684, '24-Nov-65');
insert into Passenger values(passengerID_seq.nextval, 'Joseph', 'Miller', '25 Elm Street', 'Las Vegas', 'NV', 32569, 6428369619, '3-Aug-75');
insert into Passenger values(passengerID_seq.nextval, 'Richard', 'Davis', '148 Cedar Ave.', 'Seattle', 'WA', 41587, 1946825344, '13-Dec-81');
insert into Passenger values(passengerID_seq.nextval, 'Thomas', 'Rodriguez', '2 Boylston Street', 'Portland', 'OR', 78965, 9864752346, '9-Nov-99');
insert into Passenger values(passengerID_seq.nextval, 'Charles', 'Lee', '123 Main Street', 'Miami', 'FL', 96321, 8946557732, '21-Jan-56');
insert into Passenger values(passengerID_seq.nextval, 'Christopher', 'Martinez', '25 Forest Ave.', 'Phoenix', 'AZ', 65412, 7988641411, '6-Feb-96');
insert into Passenger values(passengerID_seq.nextval, 'Daniel', 'Gonzales', '29 Lake Hill Dr.', 'San Diego', 'CA', 98741, 2324648888, '31-Aug-91');
select * from Passenger;
Create sequence cruiseID_seq start with 1 increment by 1;
insert into Cruise values(cruiseID_seq.nextval, 8, '15-Mar-16', '22-Mar-16', 7);
insert into Cruise values(cruiseID_seq.nextval, 2, '20-Feb-16', '27-Feb-16', 7);
insert into Cruise values(cruiseID_seq.nextval, 1, '3-Jun-16', '12-Jun-16', 9);
insert into Cruise values(cruiseID_seq.nextval, 3, '17-May-16', '26-May-16', 9);
insert into Cruise values(cruiseID_seq.nextval, 7, '11-Apr-16', '22-Apr-16', 10);
insert into Cruise values(cruiseID_seq.nextval, 5, '24-Nov-16', '01-Dec-16', 7);
insert into Cruise values(cruiseID_seq.nextval, 4, '3-Aug-16', '10-Aug-16', 7);
insert into Cruise values(cruiseID_seq.nextval, 6, '13-Dec-16', '23-Dec-16', 10);
select * from Cruise;
Create sequence shipID_seq start with 1 increment by 1;
insert into Ship values(shipID_seq.nextval, 'Getaway', 2014, 2019, 3963);
insert into Ship values(shipID_seq.nextval, 'Breakaway', 2013, 2018, 3963);
insert into Ship values(shipID_seq.nextval, 'Dawn', 2002, 2016, 2340);
insert into Ship values(shipID_seq.nextval, 'Jewel', 2005, 2018, 2386);
insert into Ship values(shipID_seq.nextval, 'Epic', 2010, 2020, 4100);
insert into Ship values(shipID_seq.nextval, 'Joy', 2017, 2019, 3804);
insert into Ship values(shipID_seq.nextval, 'Gem', 2007, 2015, 2394);
insert into Ship values(shipID_seq.nextval, 'Spirit', 1998, 2020, 2018);
select * from Ship;
insert into RoomType values('Suite', 8);
insert into RoomType values('Spa Stateroom', 5);
insert into RoomType values('Balcony Suite', 4);
insert into RoomType values('Oceanview', 4);
insert into RoomType values('Studio', 1);
select * from RoomType;
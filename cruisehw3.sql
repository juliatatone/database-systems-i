--1b

Alter table Cruise
	Add constraint shipID
	Foreign Key (shipID)
	References Ship (shipID)
	On delete cascade;

	Alter table Booking
	Add constraint passengerID
	Foreign Key (passengerID)
	References Passenger (passengerID)
	On delete cascade;

	Alter table Booking
	Add constraint cruiseID
	Foreign Key (cruiseID)
	References Cruise (cruiseID)
	On delete cascade;

	Alter table DiningReservation
	Add constraint passengerID
	Foreign Key (passengerID)
	References Passenger (passengerID)
	On delete cascade;

	Alter table DiningReservation
	Add constraint restaurantName
	Foreign Key (restaurantName)
	References Dining (restaurantName)
	On delete cascade;

	Alter table Dining
	Add constraint shipName
	Foreign Key (shipName)
	References Ship (shipName)
	On delete cascade;

	Alter table Booking
	Add constraint roomType
	Foreign Key (roomType)
	References RoomType (roomType)
	On delete cascade;

--2b

Select shipName, count(portName)
	from Location natural join Cruise natural join Ship
	Where cruiseLength < 10 and excursion = 'Y'
	Group By shipName 
	Having count(portName) >= 2;

--3b

Select shipName, maxPassengers, startDate
From Cruise C join Ship S 
On C.shipID = S.shipID
Where startDate >= '01-Dec-2021' or maxPassengers < 3000;

--4b

Select distinct DR.restaurantName
	From DiningReservation DR Join Passenger P 
	On DR.passengerID = P.passengerID 
	Where state = 'MA' or state = 'NY'
	group by DR.restaurantName;

--5b

Select sum(fee) as Sales, DR.restaurantName
From(select restaurantName,  fee
From Dining 
Where isBuffet = ‘Y’) D
Join(select restaurantName, passengerID
From DiningReservation ) DR
On DR.restaurantName = D.restaurantName 
Group by DR.restaurantName
Having sum(fee) > 100;

--3b
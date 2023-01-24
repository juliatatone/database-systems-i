ALTER TABLE Booking
ADD FOREIGN KEY (passengerID) REFERENCES Passenger(passengerID);

ALTER TABLE Booking
ADD FOREIGN KEY (roomType) REFERENCES RoomType(RoomType);

ALTER TABLE Booking
ADD FOREIGN KEY (cruiseID) REFERENCES Cruise(cruiseID);

ALTER TABLE Cruise
ADD FOREIGN KEY (shipID) REFERENCES Ship(shipID);


Select shipName, cruiseLength || ',' || startDate || ',' ||  endDate as lengthOfCruise
From Cruise C natural join Ship S
Where(shipID) = 2 or cruiseLength = 9
Order By shipName;

Select B.roomType, P.passengerID, firstName || ' ' || lastName as PassengerName, address || ', ' || city || ', ' || state || ', ' || zipcode as FullAddress
From Passenger P join Booking B
	On P.passengerID > 3 AND B.roomType = 'Studio'
order by PassengerName;

Select P.firstName, P.lastName, S.shipName, C.startDate, C.endDate
From Cruise C Join Ship S 
	on C.shipID = S.shipID
Join Booking B
	on C.cruiseID = B.cruiseID
Join Passenger P
	on B.passengerID = P.passengerID
Where C.startDate > '30-Jun-16'
Order by P.firstName, S.shipName;


Select P.firstName, P.lastName 
From Booking B join Passenger P
	on B.passengerID = P.passengerID
Join Cruise C
	on B.cruiseID = C.cruiseID
Where(price) > 500 and cruiseLength = 7
Order By firstName;